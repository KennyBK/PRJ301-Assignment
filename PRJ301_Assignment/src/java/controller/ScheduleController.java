/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SessionDBContext;
import dal.TimeslotDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.HashMap;
import model.Session;
import model.Timeslot;

/**
 *
 * @author ACER
 */
public class ScheduleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private HashMap<Integer, ArrayList<Date>> weeks;
    private ArrayList<Integer> years;

    private HashMap<Integer, ArrayList<Date>> listWeek(int year, int month, int day) {
        LocalDate ld = LocalDate.of(year, month, day);
        LocalDate date = ld;
        Date startDate;
        Date endDate;
        HashMap<Integer, ArrayList<Date>> listWeek = new HashMap<>();
        Integer value = 0;
        ArrayList<Date> fromto = null;
        while (date.getYear() <= ld.getYear()) {
            value++;
            startDate = Date.valueOf(date);
            date = date.plusWeeks(1);
            endDate = Date.valueOf(date.minusDays(1));

            fromto = new ArrayList<>();
            fromto.add(startDate);
            fromto.add(endDate);
            listWeek.put(value, fromto);
        }
        return listWeek;
    }

    private ArrayList<Integer> listYear(Integer startYear, Integer endYear) {
        ArrayList<Integer> years = new ArrayList<>();
        Integer currYear = startYear;
        while (currYear <= endYear) {
            years.add(currYear);
            currYear++;
        }
        return years;
    }

    static LocalDate getFirstDayOfWeek(int year, int weekNumber) {
        return LocalDate
                .of(year, 2, 1)
                .with(WeekFields.of(DayOfWeek.MONDAY, 7).getFirstDayOfWeek())
                .with(WeekFields.of(DayOfWeek.MONDAY, 7).weekOfWeekBasedYear(), weekNumber);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        years = listYear(2019, 2023);

        LocalDate now = LocalDate.now();
        LocalDate firstDateOfWeekOfAYear = getFirstDayOfWeek(now.getYear(), 1);
        weeks = listWeek(firstDateOfWeekOfAYear.getYear(), firstDateOfWeekOfAYear.getMonthValue(), firstDateOfWeekOfAYear.getDayOfMonth());
        Date date_now = Date.valueOf(now);

        Date startDate = null;
        Date endDate = null;

        Integer firstKey = null;
        for (Integer key : weeks.keySet()) {
            Date firstDayOftheWeek = weeks.get(key).get(0);
            Date lastDayOftheWeek = weeks.get(key).get(1);
            if (date_now.compareTo(firstDayOftheWeek) >= 0 && date_now.compareTo(lastDayOftheWeek) <= 0) {
                startDate = firstDayOftheWeek;
                endDate = lastDayOftheWeek;
                firstKey = key;
                break;
            }
        }
        TimeslotDBContext tdb = new TimeslotDBContext();
        ArrayList<Timeslot> timeslots = tdb.list();

        SessionDBContext sdb = new SessionDBContext();
        ArrayList<Session> sessions = sdb.getListSessionInSpecificWeek(startDate, endDate);

        ArrayList<Date> datesinweek = new ArrayList<>();
        Date begindate = startDate;

        while (begindate.compareTo(endDate) <= 0) {
            datesinweek.add(begindate);
            LocalDate nextDay = begindate.toLocalDate().plusDays(1);
            begindate = Date.valueOf(nextDay);
        }

        request.setAttribute("years", years);
        request.setAttribute("firstkey", firstKey);
        request.setAttribute("weekinayear", weeks);
        request.setAttribute("datesinweek", datesinweek);
        request.setAttribute("sessions", sessions);
        request.setAttribute("timeslots", timeslots);
        request.getRequestDispatcher("/view/schedule/schedule.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date startDate = null;
        Date endDate = null;

        String year = request.getParameter("year");
        String value = request.getParameter("period");
        if (year != null && value == null) {
            LocalDate firstDateOfWeekOfAYear = getFirstDayOfWeek(Integer.parseInt(year), 1);
            weeks = listWeek(firstDateOfWeekOfAYear.getYear(), firstDateOfWeekOfAYear.getMonthValue(), firstDateOfWeekOfAYear.getDayOfMonth());

            startDate = weeks.get(1).get(0);
            endDate = weeks.get(1).get(1);
            LocalDate now = LocalDate.now();
            Date date_now = Date.valueOf(now);
            if (Integer.parseInt(year) == now.getYear()) {
                Integer firstKey = null;
                for (Integer key : weeks.keySet()) {
                    Date firstDayOftheWeek = weeks.get(key).get(0);
                    Date lastDayOftheWeek = weeks.get(key).get(1);
                    if (date_now.compareTo(firstDayOftheWeek) >= 0 && date_now.compareTo(lastDayOftheWeek) <= 0) {
                        startDate = firstDayOftheWeek;
                        endDate = lastDayOftheWeek;
                        firstKey = key;
                        break;
                    }
                }
                request.setAttribute("firstkey", firstKey);
            }
        }

        if (value != null) {
            ArrayList<Date> fromto = weeks.get(Integer.parseInt(value));

            startDate = fromto.get(0);
            endDate = fromto.get(1);
        }

        TimeslotDBContext tdb = new TimeslotDBContext();
        ArrayList<Timeslot> timeslots = tdb.list();

        SessionDBContext sdb = new SessionDBContext();
        ArrayList<Session> sessions = sdb.getListSessionInSpecificWeek(startDate, endDate);

        ArrayList<Date> datesinweek = new ArrayList<>();
        Date begindate = startDate;

        while (begindate.compareTo(endDate) <= 0) {
            datesinweek.add(begindate);
            LocalDate nextDay = begindate.toLocalDate().plusDays(1);
            begindate = Date.valueOf(nextDay);
        }

        request.setAttribute("years", years);
        request.setAttribute("weekinayear", weeks);
        request.setAttribute("datesinweek", datesinweek);
        request.setAttribute("sessions", sessions);
        request.setAttribute("timeslots", timeslots);
        request.getRequestDispatcher("/view/schedule/schedule.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
