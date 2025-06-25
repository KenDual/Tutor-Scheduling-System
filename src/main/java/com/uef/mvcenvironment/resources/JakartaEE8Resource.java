package com.uef.mvcenvironment.resources;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;

/**
 * Simple ping endpoint. Truy cập:  GET /resources/rest
 */
@Path("/rest")
public class JakartaEE8Resource {

    @GET
    public Response ping() {
        return Response.ok("ping").build();
    }
}
