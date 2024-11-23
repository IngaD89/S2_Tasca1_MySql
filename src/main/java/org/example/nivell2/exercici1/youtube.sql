--done--
CREATE TABLE youtube.users(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
encrypted_password VARCHAR(100) NOT NULL,
user_name VARCHAR (100) NOT NULL,
birth_data TIMESTAMP NOT NULL,
sex ENUM ('Female', 'Male', 'Prefer not to respond') NOT NULL,
country VARCHAR (60) NOT NULL,
zip_code VARCHAR (20) NOT NULL
);

--Done--
CREATE TABLE youtube.password(
user_id INT NOT NULL,
encrypted_password VARCHAR(100) NOT NULL,
created_at TIMESTAMP NOT NULL,
CONSTRAINT FK_user_password FOREIGN KEY (user_id) REFERENCES users(id)
);
--Done--
CREATE TABLE youtube.video(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
title VARCHAR(100) NOT NULL,
description VARCHAR(525) NOT NULL,
video_size BIGINT NOT NULL,
file_name VARCHAR (100) NOT NULL,
duration FLOAT NOT NULL,
thumbnail_path VARCHAR(100) NOT NULL,
playback_number INT NOT NULL,
status ENUM ('Public', 'Private', 'Hide') NOT NULL,
tag VARCHAR(60) NOT NULL,
CONSTRAINT FK_user_video FOREIGN KEY(user_id) REFERENCES users(id)
);
--Done--
CREATE TABLE youtube.qualification_type(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
type_value VARCHAR(20) NOT NULL
);
--Done--
CREATE TABLE youtube.video_qualification(
user_id INT NOT NULL,
video_id INT NOT NULL,
qualification_type_id INT NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
counting INT NOT NULL DEFAULT 0,
CONSTRAINT FK_user_qualification FOREIGN KEY (user_id) REFERENCES users(id),
CONSTRAINT FK_video_qualification FOREIGN KEY (video_id) REFERENCES video(id),
CONSTRAINT FK_video_type_qualification FOREIGN KEY (qualification_type_id) REFERENCES qualification_type(id)
);
--Done--
CREATE TABLE youtube.channel(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
name VARCHAR(100) NOT NULL,
description TEXT NOT NULL,
CONSTRAINT FK_user_channel FOREIGN KEY (user_id) REFERENCES users(id)
);
--Done--
CREATE TABLE youtube.subscription(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
channel_id INT NOT NULL,
CONSTRAINT FK_user_subs FOREIGN KEY (user_id) REFERENCES users(id),
CONSTRAINT FK_channel_subs FOREIGN KEY (channel_id) REFERENCES channel(id)
);
--Done--
CREATE TABLE youtube.comment(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
video_id INT NOT NULL,
user_id INT NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
comment_text TEXT NOT NULL,
CONSTRAINT FK_user_comment FOREIGN KEY (user_id) REFERENCES users(id),
CONSTRAINT FK_video_comment FOREIGN KEY (video_id) REFERENCES video(id)
);
--Done--
CREATE TABLE youtube.comment_qualification(
user_id INT NOT NULL,
comment_id INT NOT NULL,
qualification_type_id INT NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_user_comment_qualification FOREIGN KEY (user_id) REFERENCES users(id),
CONSTRAINT FK_comment_qualification FOREIGN KEY (comment_id) REFERENCES comment(id),
CONSTRAINT FK_type_qualification FOREIGN KEY (qualification_type_id) REFERENCES qualification_type(id)
);
--Done--
CREATE TABLE youtube.playlist(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
name VARCHAR(100) NOT NULL,
status ENUM ('Public', 'Private') NOT NULL,
CONSTRAINT FK_user_playlist FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE youtube.playlist_video(
playlist_id INT NOT NULL,
video_id INT NOT NULL,
CONSTRAINT FK_user_playlist_video FOREIGN KEY(playlist_id) REFERENCES playlist(id),
CONSTRAINT FK_video_playlist FOREIGN KEY(video_id) REFERENCES video(id)
);