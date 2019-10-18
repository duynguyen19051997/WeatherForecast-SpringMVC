<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <section id="footer_bottom_area">
        <div class="clearfix wrapper footer_bottom">
            <div class="clearfix copyright floatleft">
                <p> Copyright &copy; VinaEnter Edu. All rights reserved. Code by <a href="https://www.facebook.com/duy.justinnguyen" title="Facebook" target="_blank"><span>Nguyễn Vũ Anh Duy</span></a></p>
            </div>
            <div class="clearfix social floatright">
                <ul>
                    <li><a class="tooltip" title="Facebook" href=""><i class="fa fa-facebook-square"></i></a></li>
                    <li><a class="tooltip" title="Twitter" href=""><i class="fa fa-twitter-square"></i></a></li>
                    <li><a class="tooltip" title="Google+" href=""><i class="fa fa-google-plus-square"></i></a></li>
                </ul>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        $(document).ready(function() {
            $('.tooltip').tooltipster();
        });
    </script>
    <script type="text/javascript">
        selectnav('nav', {
            label: '-Navigation-',
            nested: true,
            indent: '-'
        });
    </script>
    <!-- <script type="text/javascript">
        $(document).ready(function() {
            $('.pgwSlider').pgwSlider({

                intervalDuration: 5000

            });
        });
    </script> -->