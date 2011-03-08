function initMenu() {
  $j('#menu ul').hide();
  $j('#menu li a').click(function() {
    $j(this).next().slideToggle('normal');
  });
}
$j(document).ready(function() {initMenu();});