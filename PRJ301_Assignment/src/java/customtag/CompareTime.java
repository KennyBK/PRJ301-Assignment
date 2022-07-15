/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package customtag;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;

/**
 *
 * @author ACER
 */
public class CompareTime extends SimpleTagSupport {

    private Time start;
    private Time end;

    public void setStart(Time start) {
        this.start = start;
    }

    public void setEnd(Time end) {
        this.end = end;
    }

    @Override
    public void doTag() throws JspException, IOException {
        Date now = new Date();
        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        String time = df.format(now);
        Time time_sql = Time.valueOf(time);
        LocalTime local_start = start.toLocalTime();
        LocalTime local_end  = end.toLocalTime();
        LocalTime local_sql = time_sql.toLocalTime();
        
        if(local_sql.isAfter(local_start) && local_sql.isBefore(local_end)){
            getJspContext().setAttribute("check", true);
        }else{
            getJspContext().setAttribute("check", false);
        }
        
    }

}
