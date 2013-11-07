// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katz.coursemanager.model;

import com.katz.coursemanager.model.Instructor;
import com.katz.coursemanager.model.InstructorDataOnDemand;
import com.katz.coursemanager.model.InstructorIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InstructorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: InstructorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: InstructorIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: InstructorIntegrationTest: @Transactional;
    
    @Autowired
    InstructorDataOnDemand InstructorIntegrationTest.dod;
    
    @Test
    public void InstructorIntegrationTest.testCountInstructors() {
        Assert.assertNotNull("Data on demand for 'Instructor' failed to initialize correctly", dod.getRandomInstructor());
        long count = Instructor.countInstructors();
        Assert.assertTrue("Counter for 'Instructor' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void InstructorIntegrationTest.testFindInstructor() {
        Instructor obj = dod.getRandomInstructor();
        Assert.assertNotNull("Data on demand for 'Instructor' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Instructor' failed to provide an identifier", id);
        obj = Instructor.findInstructor(id);
        Assert.assertNotNull("Find method for 'Instructor' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Instructor' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void InstructorIntegrationTest.testFindAllInstructors() {
        Assert.assertNotNull("Data on demand for 'Instructor' failed to initialize correctly", dod.getRandomInstructor());
        long count = Instructor.countInstructors();
        Assert.assertTrue("Too expensive to perform a find all test for 'Instructor', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Instructor> result = Instructor.findAllInstructors();
        Assert.assertNotNull("Find all method for 'Instructor' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Instructor' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void InstructorIntegrationTest.testFindInstructorEntries() {
        Assert.assertNotNull("Data on demand for 'Instructor' failed to initialize correctly", dod.getRandomInstructor());
        long count = Instructor.countInstructors();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Instructor> result = Instructor.findInstructorEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Instructor' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Instructor' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void InstructorIntegrationTest.testFlush() {
        Instructor obj = dod.getRandomInstructor();
        Assert.assertNotNull("Data on demand for 'Instructor' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Instructor' failed to provide an identifier", id);
        obj = Instructor.findInstructor(id);
        Assert.assertNotNull("Find method for 'Instructor' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyInstructor(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Instructor' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void InstructorIntegrationTest.testMergeUpdate() {
        Instructor obj = dod.getRandomInstructor();
        Assert.assertNotNull("Data on demand for 'Instructor' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Instructor' failed to provide an identifier", id);
        obj = Instructor.findInstructor(id);
        boolean modified =  dod.modifyInstructor(obj);
        Integer currentVersion = obj.getVersion();
        Instructor merged = (Instructor)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Instructor' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void InstructorIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Instructor' failed to initialize correctly", dod.getRandomInstructor());
        Instructor obj = dod.getNewTransientInstructor(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Instructor' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Instructor' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Instructor' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void InstructorIntegrationTest.testRemove() {
        Instructor obj = dod.getRandomInstructor();
        Assert.assertNotNull("Data on demand for 'Instructor' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Instructor' failed to provide an identifier", id);
        obj = Instructor.findInstructor(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Instructor' with identifier '" + id + "'", Instructor.findInstructor(id));
    }
    
}
