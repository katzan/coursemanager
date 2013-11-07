// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katz.coursemanager.model;

import com.katz.coursemanager.model.CourseDataOnDemand;
import com.katz.coursemanager.model.InstructorDataOnDemand;
import com.katz.coursemanager.model.Offering;
import com.katz.coursemanager.model.OfferingDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect OfferingDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OfferingDataOnDemand: @Component;
    
    private Random OfferingDataOnDemand.rnd = new SecureRandom();
    
    private List<Offering> OfferingDataOnDemand.data;
    
    @Autowired
    CourseDataOnDemand OfferingDataOnDemand.courseDataOnDemand;
    
    @Autowired
    InstructorDataOnDemand OfferingDataOnDemand.instructorDataOnDemand;
    
    public Offering OfferingDataOnDemand.getNewTransientOffering(int index) {
        Offering obj = new Offering();
        setLocationName(obj, index);
        setOfferDate(obj, index);
        return obj;
    }
    
    public void OfferingDataOnDemand.setLocationName(Offering obj, int index) {
        String locationName = "locationName_" + index;
        if (locationName.length() > 80) {
            locationName = locationName.substring(0, 80);
        }
        obj.setLocationName(locationName);
    }
    
    public void OfferingDataOnDemand.setOfferDate(Offering obj, int index) {
        Date offerDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setOfferDate(offerDate);
    }
    
    public Offering OfferingDataOnDemand.getSpecificOffering(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Offering obj = data.get(index);
        Long id = obj.getId();
        return Offering.findOffering(id);
    }
    
    public Offering OfferingDataOnDemand.getRandomOffering() {
        init();
        Offering obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Offering.findOffering(id);
    }
    
    public boolean OfferingDataOnDemand.modifyOffering(Offering obj) {
        return false;
    }
    
    public void OfferingDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Offering.findOfferingEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Offering' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Offering>();
        for (int i = 0; i < 10; i++) {
            Offering obj = getNewTransientOffering(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
