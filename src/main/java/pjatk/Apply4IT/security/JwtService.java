package pjatk.Apply4IT.security;

import pjatk.Apply4IT.model.User;

public interface JwtService {
    String getStringTokenFromUser(User user, Long periodOfValidity, String issuer, boolean isAccessToken);

    User getUserFromToken(String token);

    User getUserFromRefreshToken(String token);
}
