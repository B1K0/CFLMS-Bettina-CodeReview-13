<?php

namespace App\Controller;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

use App\Entity\Event;

class EventController extends AbstractController
{
    #[Route('/', name: 'event')]
    public function index(): Response
    {
        $event = $this->getDoctrine()->getRepository('App:Event')->findAll();    
        return $this->render('event/index.html.twig', array('events'=>$event));
    }

    /**    
     * @Route("/create", name="event_create")
     */
    public function create(Request $request): Response
    {
        $event = new Event;
        $form = $this->createFormBuilder($event)
        ->add('name', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('description', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('location', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('picture', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('date', DateTimeType::class, array('attr' => array('style'=>'margin-bottom:15px')))
        ->add('capacity', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('phone', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('email', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('url', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
        ->add('save', SubmitType::class, array('label'=> 'Create event', 'attr' => array('class'=> 'btn-primary', 'style'=>'margin-bottom:15px')))
        ->getForm();
        $form->handleRequest($request);     

        if($form->isSubmitted() && $form->isValid()){
            $name = $form['name']->getData();
            $description = $form['description']->getData();
            $picture = $form['picture']->getData();
            $location = $form['location']->getData();
            $date = $form['date']->getData();          

            $event->setName($name);
            $event->setDescription($description);
            $event->setPicture($picture);
            $event->setDate($date);
            $event->setLocation($location);
            $em = $this->getDoctrine()->getManager();
            $em->persist($event);
            $em->flush();
            $this->addFlash(
                    'notice',
                    'event Added'
                    );
            return $this->redirectToRoute('event');
        }
        /* now to make the form we will add this line form->createView() and now you can see the form in create.html.twig file  */
        return $this->render('event/create.html.twig', array('form' => $form->createView()));
    }

    /**
    * @Route("/edit/{id}", name="event_edit")
    */
    public function edit(Request $request, $id): Response
    {
        $event = $this->getDoctrine()->getRepository('App:Event')->find($id);
        $event->setName($event->getName());
        $event->setLocation($event->getLocation());
        $event->setDescription($event->getDescription());
        $event->setPicture($event->getPicture());
        $event->setDate($event->getDate());

        $form = $this->createFormBuilder($event)
            ->add('name', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-botton:15px')))
            ->add('location', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
            ->add('description', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-botton:15px')))
            ->add('picture', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-botton:15px')))
            ->add('date', DateTimeType::class, array('attr' => array('style'=>'margin-bottom:15px')))
            ->add('capacity', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
            ->add('phone', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
            ->add('email', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
            ->add('url', TextareaType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:15px')))
            ->add('save', SubmitType::class, array('label'=> 'Update Event', 'attr' => array('class'=> 'btn-primary', 'style'=>'margin-botton:15px')))
            ->getForm();
        $form->handleRequest($request);


        if($form->isSubmitted() && $form->isValid()){
           //fetching data
            $name = $form['name']->getData();
            $location = $form['location']->getData();
            $description = $form['description']->getData();
            $picture = $form['picture']->getData();
            $date = $form['date']->getData();
            $em = $this->getDoctrine()->getManager();
            $event = $em->getRepository('App:Event')->find($id);
            $event->setName($name);
            $event->setLocation($location);
            $event->setDescription($description);
            $event->setPicture($picture);
            $event->setDate($date);
            
            $em->flush();
            $this->addFlash(
                    'notice',
                    'Event Updated'
                    );
            return $this->redirectToRoute('event');
        }
        return $this->render('event/edit.html.twig', array('event' => $event, 'form' => $form->createView()));  
    }

    /**
    * @Route("/details/{id}", name="event_details")
    */
    public function details($id): Response
    {
        $event = $this->getDoctrine()->getRepository('App:Event')->find($id);
        return $this->render('event/details.html.twig', array('event' => $event));
        }

    /**
     * @Route("/delete/{id}", name="event_delete")
     */
    public function delete($id){
        $em = $this->getDoctrine()->getManager();
        $event = $em->getRepository('App:Event')->find($id);
        $em->remove($event);   
        $em->flush();
        $this->addFlash(
            'notice',
            'Event Removed'
        );    
        return $this->redirectToRoute('event');
    }
}
