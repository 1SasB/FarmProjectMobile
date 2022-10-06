getHeadersWithToken(token) {
  return <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'x-auth-token': token!,
  };
}