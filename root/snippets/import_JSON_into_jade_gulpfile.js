var gulp = require('gulp'),
  jade = require('gulp-jade'),
  data = require('gulp-data'),
  fs = require('fs');

gulp.task('jade', function(){
  return gulp.src('src/jade/*.jade')
    .pipe(data( function(file) {
      return JSON.parse(fs.readFileSync('src/data.json'));
    } ))
    .pipe(jade())
    .pipe(gulp.dest('dist'))
});