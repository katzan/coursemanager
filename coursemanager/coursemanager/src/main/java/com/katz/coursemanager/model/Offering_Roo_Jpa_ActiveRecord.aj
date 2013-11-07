// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katz.coursemanager.model;

import com.katz.coursemanager.model.Offering;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Offering_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Offering.entityManager;
    
    public static final EntityManager Offering.entityManager() {
        EntityManager em = new Offering().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Offering.countOfferings() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Offering o", Long.class).getSingleResult();
    }
    
    public static List<Offering> Offering.findAllOfferings() {
        return entityManager().createQuery("SELECT o FROM Offering o", Offering.class).getResultList();
    }
    
    public static Offering Offering.findOffering(Long id) {
        if (id == null) return null;
        return entityManager().find(Offering.class, id);
    }
    
    public static List<Offering> Offering.findOfferingEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Offering o", Offering.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Offering.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Offering.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Offering attached = Offering.findOffering(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Offering.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Offering.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Offering Offering.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Offering merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
