package com.katz.coursemanager.repository;

import java.util.List;

import com.katz.coursemanager.model.Course;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.transaction.annotation.Transactional;

@RooJpaRepository(domainType = Course.class)
public interface CourseRepository {
	
	@Query("SELECT o FROM Course AS o WHERE LOWER(o.name) LIKE LOWER(:name)")
	@Transactional(readOnly=true)
	List<Course>findCoursesByNameLikeViaRepo(@Param("name") String name);
}
