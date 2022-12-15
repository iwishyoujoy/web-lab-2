package ru.iwishyoujoy.web_lab_2.servlets;

import ru.iwishyoujoy.web_lab_2.model.Dot;
import ru.iwishyoujoy.web_lab_2.model.DotCollectionManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import static java.time.temporal.ChronoUnit.MINUTES;

@WebServlet(name = "area-check-servlet", value = "/area-check-servlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter printWriter = response.getWriter();

        long timer = System.nanoTime();

        try {
            float x = Float.parseFloat(request.getParameter("x-value"));
            float y = Float.parseFloat(request.getParameter("y-value"));
            float r = Float.parseFloat(request.getParameter("r-value"));

            log("X: " + x);
            log("Y: " + y);
            log("R: " + r);

            String status = isHit(x, y, r);

            int timezone = Integer.parseInt(request.getParameter("timezone"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            String currentTime = formatter.format(LocalDateTime.now().plus(timezone, MINUTES));
            long scriptTime = (long) ((System.nanoTime()-timer)*0.001);

            Object collection = getServletContext().getAttribute("dots");

            if (collection == null){
                collection = new DotCollectionManager();
            }

            DotCollectionManager dotsCollection = (DotCollectionManager)collection;

            Dot newDot = new Dot(x, y, r, currentTime, scriptTime, status);
            dotsCollection.add(newDot);
            log("Shot successfully added");

            getServletContext().setAttribute("dots", dotsCollection);

            String responseBody = newDot.toJSON();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            printWriter.write(responseBody);
            printWriter.flush();
        } catch (NumberFormatException ignored) {
        }
    }

    private String isHit(double x, double y, double r) {
        if (isCircleZone(x, y, r) || isTriangleZone(x, y, r) || isRectangleZone(x, y, r)){
            return "попадание!";
        }
        return "промах!";
    }

    private boolean isRectangleZone(double x, double y, double r) {
        return (x >= 0) && (y <= 0) && (x <= r) && (y >= (-1)* r/2);
    }

    private boolean isCircleZone(double x, double y, double r) {
        return (x * x + y * y <= r/2 * r/2) && (x >= 0) && (y >= 0);
    }

    private boolean isTriangleZone(double x, double y, double r) {
        return (x <= 0) && (y >= 0) && (y <= 2 * x + r);
    }
}
