<?php

namespace App\Controller;

use Swift_Mailer;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends AbstractController
{
    /**
     * @Route("/")
     */
    public function index(): Response
    {
        $number = random_int(0, 100);

        return new Response(
            '<html><body>Index page loaded successfully.</body></html>'
        );
    }

    /**
     *
     * @Route("/mail")
     */
    public function sendmailTest(Swift_Mailer $mailer): Response
    {
        $message = (new \Swift_Message('Hello Email'))
            ->setFrom('send@example.com')
            ->setTo('recipient@example.com')
            ->setBody(
                $this->renderView(
                    'emails/test.txt.twig'
                ),
                'text/html'
            )
        ;
        $successCount = $mailer->send($message);

        return new Response(
            '<html><body>Mail sent successfully to: '.$successCount.' recipients.</body></html>'
        );
    }
}
