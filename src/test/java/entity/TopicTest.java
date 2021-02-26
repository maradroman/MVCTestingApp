package entity;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;




import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;


class TopicTest {
    Topic topic = null;

    @BeforeEach
    void init() {
        topic = new Topic();
        topic.setName("Hitchhiker's Guide to the Galaxy");
        topic.setId(42);
    }

    @Test
    void getId() {
        assertThat(42, equalTo(topic.getId()));

    }

    @Test
    void setId() {
        topic.setId(40);
        assertThat(40, equalTo(topic.getId()));
    }

    @Test
    void getName() {
        assertThat("Hitchhiker's Guide to the Galaxy", equalTo(topic.getName()));
    }

    @Test
    void setName() {
        topic.setName("New Name");
        assertThat("New Name", equalTo(topic.getName()));
    }

    @Test
    void testToString() {
        assertThat("Topic{id=42, name='Hitchhiker's Guide to the Galaxy'}", equalTo(topic.toString()));
    }
}