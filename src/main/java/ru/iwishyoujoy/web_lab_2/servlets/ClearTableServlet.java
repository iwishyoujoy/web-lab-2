package ru.iwishyoujoy.web_lab_2.servlets;

import ru.iwishyoujoy.web_lab_2.model.DotCollectionManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ClearTableServlet", value = "/cleaner")
public class ClearTableServlet extends HttpServlet {
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object collection = getServletContext().getAttribute("dots");

        if (collection != null){
            DotCollectionManager dotsCollection = (DotCollectionManager)collection;
            dotsCollection.clear();
            getServletContext().setAttribute("dots", dotsCollection);
        }

    }
}
