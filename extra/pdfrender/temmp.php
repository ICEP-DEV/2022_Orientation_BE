<?Php
require('fpdf.php');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');


class PdfEncode extends FPDF{
   function header()
   {
	    $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";	   
		$components = parse_url($actual_link, PHP_URL_QUERY);
		//$component parameter is PHP_URL_QUERY
		parse_str($components, $results);
		
	   
        $this->Image('Certificate-min.jpg',0,0,297,210);
        $this->SetFont('Courier','B',33);
		$this->SetTextColor(13, 71, 148);
        $this->Cell(276,235,$results["firstname"]." ".$results["lastname"],2,0,'C');
        $this->Ln(60.5);
        $this->SetFont('Arial','B',13);
		$this->SetTextColor(13, 71, 148);
        $this->Cell(299,235,date("Y/m/d"),0,0,'C');
        $this->Ln(20);
   }
}

$printOut = new PdfEncode();
$printOut->AliasNbPages();
$printOut->AddPage('L','A4',0);
$printOut->Output("D","OfficeForm.pdf");
//http://localhost/pdfrender/temmp.php


?>