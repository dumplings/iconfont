const iconfontCss = require('gulp-iconfont-css')
const iconfont = require('gulp-iconfont')
const gulp = require('gulp')
const del = require('del')
const svgMin = require('gulp-svgmin')

const fontName = 'dumplings-icons'

const iconfontTransfer = (done) => {
  gulp.src(['./svg/*.svg'])
    .pipe(svgMin({
      plugins: [{
        convertToPathData: false,
      }, {
        mergePaths: false,
      }],
    }))
    .pipe(iconfontCss({
      fontName,
      path: './_template.tpl',
      targetPath: './dp-icons.css',
      cssClass: 'dp-icon',
    }))
    .pipe(iconfont({
      fontName,
      prependUnicode: true,
      normalize: true,
      fontHeight: 1001,
      formats: ['ttf', 'woff', 'svg'],
    }))
    .pipe(gulp.dest('./dist'))
  done()
}

const clean = () => del(['./dist/**/*'])

exports.default = gulp.series(clean, iconfontTransfer)