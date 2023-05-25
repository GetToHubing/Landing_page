package dao;

import models.User;

public interface Users {
User findByEmail(String email);

Long insert(User user);

void update(User updatedUser);

void delete(long userId);
}
