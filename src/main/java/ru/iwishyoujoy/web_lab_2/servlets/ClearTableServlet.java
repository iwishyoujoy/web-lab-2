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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DotCollectionManager.clear();
        getServletContext().setAttribute("dots", DotCollectionManager.getCollection());
    }
}
