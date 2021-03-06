package project.webservices.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilderException;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.core.Response.Status;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import project.core.Rental;
import project.webservices.db.ListRentalDAO;

@Path("/rental")
public class RentalResource {
	private static Logger log = LoggerFactory.getLogger(RentalResource.class);

	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Rental> getRentals() throws SQLException {
		log.info("getRentals");
		return ListRentalDAO.instance().getRentals();
	}

	@GET
	@Path("get_rental_checkin/{check_in}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Rental getRental(@PathParam("check_in") Date check_in) throws SQLException {
		return ListRentalDAO.instance().getRental(check_in);
	}

	@GET
	@Path("get_rental_user/{id_user}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Rental> findIdUser( @PathParam("id_user") Integer id_user) throws SQLException {
		return ListRentalDAO.instance().findIdUser(id_user);
	}

	@GET
	@Path("get_rental_home/{id_home}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public boolean findIdHome( @PathParam("id_home") Integer id_home) throws SQLException {
		return ListRentalDAO.instance().findIdHome(id_home);
	}

	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response postRentals(@Context UriInfo uriInfo, Rental rental) throws IllegalArgumentException, UriBuilderException, SQLException {
		log.info("postRentals: {}", rental);
		Response response;
		if (ListRentalDAO.instance().addRental(rental)) {
			response =  Response.created(uriInfo.getRequestUriBuilder().build()).entity(rental).build();
		} else {
			response = Response.seeOther(uriInfo.getRequestUriBuilder().build()).build();
			response =Response.notModified().build();
		}
		log.info("[RentalResource] postRentals: response status: {} {}", response.getStatus(), response.getStatusInfo());
		return response;
	}

	@PUT
	@Path("check_in/{check_in}")
	public Response putUser(@PathParam("check_in") Date check_in, Rental newRental) throws SQLException {
		//Only the replace functionality is implemented
		Response response;
		if (ListRentalDAO.instance().updateRental(check_in, newRental)) {
			response = Response.noContent().build();
		} else {
			response = Response.status(Status.NOT_FOUND).build();
		}
		return response;
	}

	@DELETE
	public Response deleteRentals() {
		return Response.status(Status.METHOD_NOT_ALLOWED).allow("GET", "POST").build();
	}

	@DELETE
	@Path("id_all/{id_home}/{id_user}")
	public boolean deleteRental(@PathParam("id_home") String id_home, @PathParam("id_user") String id_user) throws SQLException {
		//Only the replace functionality is implemented
		boolean response;
		if (ListRentalDAO.instance().deleteRental(id_home, id_user)) {
			response = true;
		} else {
			response =false;
		}
		return response;
	}
}
