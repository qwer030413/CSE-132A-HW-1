-- Change the type of all “jumbo mortgage” loans to “student” and the type of all original “student” loans to “jumbo mortgage”.

UPDATE loan SET type = 'temp' WHERE type = 'jumbo mortgage';

UPDATE loan SET type = 'jumbo mortgage' WHERE type = 'student';

UPDATE loan SET type = 'student' WHERE type = 'temp';