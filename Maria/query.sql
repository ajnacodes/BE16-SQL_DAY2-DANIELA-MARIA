select user.fname, user.lname, book.title, book.author, book.publisher, rent.rent_start,rent.rent_end,rent.price,library.name,library.address from user
JOIN many_books ON user.id = many_books.fk_user
JOIN book ON many_books.fk_book = book.id
JOIN rent ON many_books.fk_rent = rent.id
JOIN library on many_books.fk_library = library.id;

select user.nick, user.email,user.photo, user.password_user,user.age,user.f_name,user.l_name, comment.publication, comment.comment_text, post.description, photo.filename FROM user
JOIN post ON user.user_id = post.fk_user_id
JOIN info ON post.post_id = info.fk_post_id
JOIN photo ON info.fk_photo_id = photo.photo_id
JOIN comment ON info.fk_comment_id = comment.comment_id