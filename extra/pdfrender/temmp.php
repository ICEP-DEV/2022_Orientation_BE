<?Php
require('fpdf.php');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');


class PdfEncode extends FPDF{
   function header()
   {

        $body = file_get_contents('php://input');
        $first = json_decode($body)->{'firstName'};
        $last = json_decode($body)->{'lastName'};


        $this->Image('Certificate-min.jpg',0,0,297,210);
        $this->SetFont('Arial','B',30);
        $this->Cell(276,235,"${first} ${last}",2,0,'C');
        $this->Ln(60.5);
        $this->SetFont('Arial','B',15);
        $this->Cell(299,235,date("Y/m/d"),0,0,'C');
        $this->Ln(20);
   }
}

$printOut = new PdfEncode();
$printOut->AliasNbPages();
$printOut->AddPage('L','A4',0);
$printOut->Output();





//http://localhost/pdfrender/temmp.php











?>