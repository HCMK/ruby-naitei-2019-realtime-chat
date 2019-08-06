$(document).ready(function () {
  flash_toastr();
})

function flash_toastr(){
  $flash = $(".flash_msg");
  $i=0;
  for($i=0;$i<$flash.length;$i++)
  {
    $f = $flash.eq($i);
    if ($f.hasClass("notice") || $f.hasClass("success"))
      toastr.success($f.val());
    else if($f.hasClass("alert") || $f.hasClass("danger"))
      toastr.error($f.val());
  }
}
