package com.katz.coursemanager.model;



import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.validation.ConstraintViolationException;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;
import org.springframework.transaction.annotation.Transactional;





@RooIntegrationTest(entity = Course.class)
public class CourseIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
    
    @Test
    @Transactional
    public void addAndFetchCourse() {
    	Course c = new Course();
    	c.setCourseType(CourseTypeEnum.CONTINUING_EDUCATION);
    	c.setName("Stand-up Comedy");
    	c.setDescription("You will laugh, you will it will become a part of you.");
    	c.setMaximumCapacity(10);
    	c.setListPrice(new BigDecimal(100));
    	c.persist();
    	
    	c.flush();
    	c.clear();
    	
    	Assert.assertNotNull(c.getId());
    	
    	Course c2 = Course.findCourse(c.getId());
    	Assert.assertNotNull(c2);
    	Assert.assertEquals(c.getName(), c2.getName());
    	Assert.assertEquals(c.getCourseType(), c2.getCourseType());
    	Assert.assertEquals(c.getDescription(), c2.getDescription());
    	Assert.assertEquals(c.getMaximumCapacity(), c2.getMaximumCapacity());
    }
    
    
    @Test(expected=ConstraintViolationException.class)
    public void testInvalidCourse() {
    	Course c = new Course();
    	c.persist();
    }
    
    @Test
    public void testFindByNameFinder() {
    	Course c = new Course();
    	c.setName("Basket Weaving");
    	c.setCourseType(CourseTypeEnum.SEMINAR);
    	c.setDescription("Basket weaving");
    	c.setListPrice(new BigDecimal(100));
    	c.setMaximumCapacity(100);
    	c.setRunDate(new Date());
    	
    	c.persist();
    	c.flush();
    	c.entityManager().clear();
    	
    	List<Course> courses=c.findCoursesByNameLike("Bas").getResultList();
    	Assert.assertEquals(1, courses.size());
    }
    
    @Test
    @Transactional
    public void addAndFetchCourseViaRepo() {
       	Course c = new Course();
    	c.setCourseType(CourseTypeEnum.CONTINUING_EDUCATION);
    	c.setName("Stand-up Comedy");
    	c.setDescription("You will laugh, you will it will become a part of you.");
    	c.setMaximumCapacity(10);
    	c.setListPrice(new BigDecimal(100));
    	
    	courseRepository.saveAndFlush(c);
    	c.clear();
 
   	    Assert.assertNotNull(c.getId());
    	
    	Course c2 = Course.findCourse(c.getId());
    	Assert.assertNotNull(c2);
    	Assert.assertEquals(c.getName(), c2.getName());
    	Assert.assertEquals(c.getCourseType(), c2.getCourseType());
    	Assert.assertEquals(c.getDescription(), c2.getDescription());
    	Assert.assertEquals(c.getMaximumCapacity(), c2.getMaximumCapacity());
    	
    }
    
    @Test
    public void testFindByNameViaRepoFinder() {
    	Course c = new Course();
    	c.setName("Basket Weaving");
    	c.setCourseType(CourseTypeEnum.SEMINAR);
    	c.setDescription("Basket weaving");
    	c.setListPrice(new BigDecimal(100));
    	c.setMaximumCapacity(100);
    	c.setRunDate(new Date());
    	
    	courseRepository.saveAndFlush(c);
    	c.clear();
    	
    	List<Course> courses=courseRepository.findCoursesByNameLikeViaRepo("Basket Weaving");
    	Assert.assertEquals(1, courses.size());
    	
    }
    
    @Test
    public void testPersistTagsInCourses() {
    	CourseDataOnDemand courseDod = new CourseDataOnDemand();
    	Course course = courseDod.getNewTransientCourse(0);
    	course.setListPrice(new BigDecimal("100"));
    	TagDataOnDemand tagDod = new TagDataOnDemand();
    	Tag t1 = tagDod.getNewTransientTag(0);
    	Tag t2 = tagDod.getNewTransientTag(1);
    	
    	course.getTags().add(t1);
    	course.getTags().add(t2);
    	
    	t1.getCourses().add(course);
    	t2.getCourses().add(course);
    	
    	t1.persist();
    	t2.persist();
    	t2.flush();
    	t2.clear();
    	
    	Assert.assertEquals(2, Course.findCourse(course.getId()).getTags().size());
    	
    	
    }
    
    
}
