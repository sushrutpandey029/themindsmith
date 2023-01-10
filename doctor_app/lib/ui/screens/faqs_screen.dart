import 'package:doctor_app/ui/widgets/comman/hide_show_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({ Key? key }) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,"FAQ'S",),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              children: [
                
                // SizedBox(height: 40,),
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'What is a mental illness?',
                            data:
                                'Mental illness refers to a wide range of mental health conditions or disorders that affect a person’s mood, thinking and behavior.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'What causes mental illness?',
                            data:
                                'It is becoming clear through research that many of these conditions are caused by a combination of biological, psychological, and environmental factors.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What Biological Factors Are Involved in Mental Illness?',
                            data:
                                'Some biological factors that may be involved in the development of mental illness include:\nNeurochemical Causes: Some mental illnesses have been linked to an abnormal balance of special chemicals in the brain called neurotransmitters. Neurotransmitters help nerve cells in the brain communicate with each other. If these chemicals are out of balance or are not working properly, messages may not make it through the brain correctly, leading to symptoms of mental illness. In addition, defects in or injury to certain areas of the brain have also been linked to some mental conditions.\nGenetics (heredity): Many mental illnesses run in families, suggesting that people who have a family member with a mental illness are more susceptible (have a greater likelihood of being affected) to developing a mental illness.\nInfections: Certain infections have been linked to brain damage and the development of mental illness or the worsening of its symptoms.\nStructural Causes: This involves possible problems in the "wiring" of different parts of the brain. This includes possible consequences from brain trauma.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What Psychological Factors Contribute to Mental Illness?',
                            data:
                                'Psychological factors that may contribute to mental illness include specific vulnerabilities such as personality traits, particular extremes in temperament features, specific sensitivities to negative emotions, cognitive susceptibility, dysfunctional attitudes, hopelessness, negative distortions.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What Environmental Factors Contribute to Mental Illness?',
                            data:
                                'Certain triggering factors could be significant stressors precipitating a mental illness such as:\n• Loss experiences (physical loss after a trauma, loss of significant others, separation, etc…\n• Chronic threats\n• Long-term exposure to traumatic conditions\n• Harmful family dynamics\n• Living in extreme deprivation and poverty\n• Alcohol and substance use\n• Severe neglect\n• War, natural disasters, accidents, etc.\n• Chronic pain and incapacitating chronic illness\n• Social discrimination for example towards minorities\n• Stress due to Life Events')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'Can mental illness be prevented?',
                            data:
                                'Most mental illnesses are caused by a combination of factors. However, some preventive measures can decrease the likelihood of developing mental illnesses. The concept of attributable risk has gained ground in mental health research and factors that are related to those can be potentially reduced to somehow prevent mental illnesses: prevent neglect and abuse in childhood, prevent substance abuse, prevent exposure to war, increase social support, decrease burden of other health disorders, train in management of stress etc.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'Once someone has had a mental illness can they ever get better again?',
                            data:
                                'According to the disorder, treatment can help the client in getting better and in some cases, full recovery can be achieved through adequate treatment.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'How common are mental illnesses?',
                            data:
                                'Mental illnesses are very common. In fact according to studies done by WHO, 1 out 4 Adults is at risk of developing a mental disorder.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What are some of the warning signs of mental illness?',
                            data:
                                'Symptoms of mental disorders vary depending on the type and severity of the condition. Some general symptoms that may suggest a mental illness include:\n• Problems in concentration\n• Long-lasting sadness or irritability\n• Recurrent changes in energy\n• Extremely high and low moods\n• Excessive fear, worry, or anxiety\n• Social withdrawal\n• Dramatic changes in eating or sleeping habits\n• Strong feelings of anger\n• Delusions or hallucinations (seeing or hearing things that are not really there)\n• Increasing inability to cope with daily problems and activities\n• Suicidal thoughts\n• Many unexplained physical problems\n• Confused thinking\n• Abuse of drugs and/or alcohol')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What should I do if I know someone who appears to have all of the symptoms of a serious mental disorder?',
                            data:
                                'If you know someone who is having symptoms of a mental disorder, do not just think that they will snap out of it. Notify a family member, a mental health professional, a counselor if you think a friend or family member has symptoms of a mental disorder. Try to facilitate a meeting between the person and a Mental Health professional.\nPlease note that there might be resistance because of misconceptions and lack of awareness, or the feeling of Stigma to see a Psychiatrist for the Patient.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'How do I overcome the resistance of a Patient to get Treatment?',
                            data:
                                'Your role is to make them comfortable to have a consultation where they can ask their questions, get answers and information to the concerns they may have. You may do one or more of these things:\n• Try to normalize the conversation about Mental Illness while being empathetic. \n• Offer to book a Consultation on their behalf\n• Offer to be present for the moral support during the first Consultation\n• Don\'t Force the process, just insist on an Information session instead of Diagnosis and let our Experts take it from there.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'Can I treat my Mental Illness with Willpower?',
                            data:
                                'Most of the Mental conditions which people struggle with happen because the Brain is overwhelmed by the stressors - both External and Internal. The most evidence-based and fastest results are seen when we increase the Brain\'s capacity to maintain the equilibrium by the use of modern Psychopharmacology and structured Psychotherapy.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What is the difference between a psychiatrist and a psychologist?',
                            data:
                                'While both psychiatrists and psychologists are mental health professionals, the big difference is that psychiatrists are medical physicians while psychologists are not. Because they are licensed physicians, psychiatrists can prescribe drugs. Psychologists are not allowed to do that. Psychologists, on the other hand, use psychotherapy as a treatment method.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'What treatment options are available?',
                            data:
                                'Treatment options include psychotherapy, pharmacotherapy, a combination of both as well.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'If a medication is prescribed to me and I begin to feel better after taking it, is it okay to stop taking it?',
                            data:
                                'It is common for people to stop taking their medication when they feel their symptoms have become controlled. Others may choose to stop their medication because of side effects. Another problem with stopping medication, especially if you stop it abruptly, is that you may develop withdrawal symptoms that can be very unpleasant. If your doctor feels you need to stop your medication, it is necessary to discuss it with your physician as he might be able to suggest another type of medication or adjust the dose of your medication.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'Is psychotherapy a substitute for medication?',
                            data:
                                'Psychotherapy in some cases can be sufficient for the treatment of certain mental conditions. However, it may be needed in conjunction with medication. This is why in several cases, it is not considered as a substitute for medication.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'When to Seek Help for Your Child ?',
                            data:
                                'Parents are usually the first to recognize that their child has a problem with emotions or behavior. Still, the decision to seek professional help can be difficult and painful for a parent. The first step is to gently try to talk to the child. An honest open talk about feelings can often help. Parents may choose to consult with the child\'s physicians, teachers, members of the clergy, or other adults who know the child well. These steps may resolve the problems for the child and family. Following are a few signs which may indicate that a child and adolescent psychiatric evaluation will be useful.\nYOUNGER CHILDREN:\n• Marked fall in school performance\n• Poor grades in school despite trying very hard\n• Severe worry or anxiety, as shown by regular refusal to go to school, go to sleep or take part in activities that are normal for the child\'s age\n• Frequent physical complaints\n• Hyperactivity; fidgeting; constant movement beyond regular playing with or without difficulty paying attention\n• Persistent nightmares\n• Persistent disobedience or aggression (longer than 6 months) and provocative opposition to authority figures\n• Frequent, unexplainable temper tantrums\n• Threatens to harm or kill oneself\nPRE-ADOLESCENTS AND ADOLESCENTS:\n• Marked decline in school performance\n• Inability to cope with problems and daily activities\n• Marked changes in sleeping and/or eating habits\n• Extreme difficulties in concentrating that get in the way at school or at home\n• Sexual acting out\n• Depression shown by sustained, prolonged negative mood and attitude, often accompanied by poor appetite, difficulty sleeping or thoughts of death\n• Severe mood swings\n• Strong worries or anxieties that get in the way of daily life, such as at school or socializing\n• Repeated use of alcohol and/or drugs')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What is a Child and Adolescent Psychiatrist?',
                            data:
                                'The child and adolescent psychiatrist is a physician who specializes in the diagnosis and the treatment of disorders of thinking, feeling and/or behavior affecting children, adolescents, and their families. A child and adolescent psychiatrist offers families the advantages of a medical education, the medical traditions of professional ethics, and medical responsibility for providing comprehensive care.\nThe child and adolescent psychiatrist uses a knowledge of biological, psychological, and social factors in working with clients. Initially, a comprehensive diagnostic examination is performed to evaluate the current problem with attention to its physical, genetic, developmental, emotional, cognitive, educational, family, peer, and social components. The child and adolescent psychiatrist arrives at a diagnosis and diagnostic formulation which are shared with the client and family. The child and adolescent psychiatrist then designs a treatment plan which considers all the components and discusses these recommendations with the child or adolescent and family.\nAn integrated approach may involve individual, group or family psychotherapy; medication; and/or consultation with other physicians or professionals from schools, juvenile courts, social agencies or other community organizations. In addition, the child psychiatrist is prepared and expected to act as an advocate for the best interests of children and adolescents. Child and adolescent psychiatrists perform consultations in a variety of settings.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What about Psychiatric Medication for Children and Adolescents?',
                            data:
                                'Medication can be an effective part of the treatment for several psychiatric disorders of childhood and adolescence. A doctor\'s recommendation to use medication often raises many concerns and questions in both the parents and the youngster. The physician who recommends medication should be experienced in treating psychiatric illnesses in children and adolescents. He or she should fully explain the reasons for medication use, what benefits the medication should provide, as well as possible risks and side effects and other treatment alternatives.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What is Psychotherapy for Children and Adolescents?',
                            data:
                                'Psychotherapy refers to a variety of techniques and methods used to help children and adolescents who are experiencing difficulties with their emotions or behavior. Although there are different types of psychotherapy, each relies on communications as the basic tool for bringing about change in a person\'s feelings and behaviors.\nPsychotherapy may involve an individual child, a group of children, a family, or multiple families. In children and adolescents, playing, drawing, building, and pretending, as well as talking, are important ways of sharing feelings and resolving problems.\n\nAs part of the initial assessment, a qualified mental health professional or child and adolescent psychiatrist will determine the need for psychotherapy. This decision will be based on such things as the child\'s current problems, history, level of development, ability to cooperate with treatment, and what interventions are most likely to help with the presenting concerns. Psychotherapy is often used in combination with other treatments (medication, behavior management, or work with the school). The relationship that develops between the therapist and the client is very important. The child or adolescent must feel comfortable, safe and understood. This type of trusting environment makes it much easier for the child to express his/her thoughts and feelings and to use the therapy in a helpful way.\n\nPsychotherapy helps children and adolescents in a variety of ways. They receive emotional support, resolve conflicts with people, understand feelings and problems, and try out new solutions to old problems. Goals for therapy may be specific (change in behavior, improved relations with friends or family), or more general (less anxiety, better self-esteem). The length of psychotherapy depends on the complexity and severity of problems.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'What is substance abuse?',
                            data:
                                'Substance abuse can simply be defined as a pattern of harmful use of any substance for mood-altering purposes. Medline\'s medical encyclopedia defines drug abuse as "the use of illicit drugs or the abuse of prescription or over-the-counter drugs for purposes other than those for which they are indicated or in a manner or in quantities other than directed."')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What is an addiction mental health specialist?',
                            data:
                                'An addiction mental health specialist is a mental health professional specialized in the diagnosis and treatment of addiction disorders. These disorders come in a number of shapes and forms, but have in common the feature of a repetitive behaviour that dominates an individual\'s life and is often fuelled by the ingestion of a psychoactive substance that acts on the nervous system. (alcohol, opiates, benzodiazepines, marijuana etc.). Other recognized addictive behaviour include for example pathological gambling.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'Can someone visit an addiction mental health specialist for a relative?',
                            data:
                                'The family\'s role in identifying an addiction and in motivating the client to seek treatment is often essential. Their role continues throughout the treatment and recovery phase. If the client is very resistant to suggestions of seeing a specialist, a consultation can be offered to concerned relatives, in order to help them develop a better understanding of the situation and explore measures that can be implemented until the client is ready to engage with professionals.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'Can addictions be cured?',
                            data:
                                'Many clients who currently suffer from one type of addiction or another will permanently recover, either spontaneously or with the support of a service such as ours. Others will experience relapses and hurdles over months and possibly years. Many options might need to be considered from harm reduction to residential rehabilitation in Lebanon or abroad. This is why we consider building a strong therapeutic relationship built on mutual trust and openness a cornerstone of our treatment. Strict confidentiality is respected and sharing of information takes place in the interest of the client and with his consent.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'Can I quit smoking on my own?',
                            data:
                                'Yes, it is possible to stop smoking on your own. However, some persons might need medications, counseling or combined medication and counseling. This will help them cope better with withdrawal symptoms, handling the stress and coping with difficult situations.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'How much alcohol is considered “too much”?',
                            data:
                                'Moderate alcohol consumption is defined as having up to 1 drink per day for women and up to 2 drinks per day for men. For men, heavy drinking is defined as consuming 15 drinks or more per week. For women, heavy drinking is typically defined as consuming 8 drinks or more per week.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'Is it true that moderate alcohol consumption is good for your health?',
                            data:
                                'It is a Myth. Alcohol is a recreational Drug and one should not attribute any health benefits to it.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'What is a geriatric psychiatrist?',
                            data:
                                'A geriatric psychiatrist is a medical doctor trained in psychiatry and specialized in the diagnosis and treatment of mental health issues common in older patients. Certain mental disorders, such as Alzheimer’s disease tend to occur later in life. The geriatric psychiatrist also deals with depression, anxiety, late life addiction disorders, and other disorders that can occur at any stage in life and continue in late life. A geriatric psychiatrist is better equipped to monitor other medical disorders that an older person may suffer from as well as monitor the interaction of all the medications that the patient may be taking.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'When to seek help for an old person?',
                            data:
                                'If you notice that an old person has signs of depressed mood for more than two weeks, social withdrawal, energy loss, sleep changes, problems with concentration, memory loss (especially recent or short-term memory problems), thoughts of suicide, anxiety symptoms, unexplained physical symptoms, etc.; these may be signs of a mental disorder requiring the attention of a professional.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'What is memory?',
                            data:
                                'Memory is the ability to recall the facts and events. It has three stages:\nStage 1: Encoding. This is when a person takes information in.\nStage 2: Consolidation. This is when the brain processes the information it encoded and stores it in certain areas of the brain.\nStage 3: Retrieval. This is when a person recalls information that is already stored in the brain.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What is the difference between long –term memory and short-term memory?',
                            data:
                                'Short term memory is the ability to keep information in mind for a short amount of time, such as remembering a phone number long enough to find a piece of paper. The mind is then able to store memory that is learned recently for a small period of time for use again. The amount of time the mind is able to do this is usually within seconds.\nLong term memory consists of the memories that happened more than a few minutes ago. Long-term memory is where things can be stored in the mind for a long time to be recalled later. Examples of long term memories are remembering your 18th birthday party (when you are 25), remembering what you ate for dinner a week ago, the origin of the word memory, etc.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'Is memory loss normal?',
                            data:
                                'Occasionally, one may experience memory lapses that can become more frequent with advanced age. To a certain extent, this is considered as part of normal aging. There is a distinction however between typical changes in memory and the kind of memory loss associated with Alzheimer\'s disease and dementia in general. These changes include: impairment in memory, reasoning, judgment, language and other thinking skills and are due to changes in brain structure. This is why memory loss needs to be assessed by a professional in order to check if the memory loss is due to a disease or is a normal part of aging.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'Is it normal for an older person living alone to be depressed?',
                            data:
                                'It is not normal for an older person living alone, retired, or away from his/her children to feel depressed. In fact, depression in elderly people can often go untreated because many people think that depression is a normal part of aging and a natural reaction to chronic illness, loss and retirement. Many elderly people and their families also do not recognize the symptoms of depression so it can go unnoticed.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'How can I prevent memory problems?',
                            data:
                                'Several lifestyle changes can help prevent memory problems such as:\n• A healthy diet: In fact, research has shown that a Mediterranean diet rich in fruits, vegetables, olive oil, legumes, whole grains and fish can help in preserving memory and cognitive abilities.\n• Exercise: Physical exercise has the best evidence for preserving memory and mental function with aging. Exercise can also help prevent conditions that can lead to memory loss, such as:\n\t• High blood pressure\n\t• Diabetes\n\t• High cholesterol\n\t• Obesity\n\t• Stroke\n• Mental activity: Just like physical exercise, mental exercise is good for you. Any mentally challenging activity such as playing chess, solving crosswords, or Sudoku, will keep your mind sharp.\n• Hypertension (high blood pressure), hyperlipidemia (elevated cholesterol and triglyceride), diabetes, depression and anxiety have all been shown to be linked to memory problems so treating them is a way to prevent memory problems.\n• Moderate alcohol consumption: Although alcohol consumption is not thought to be a memory enhancer, new studies have found that light alcohol consumption is linked to better memory.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'Is it better to keep an older person with dementia at home or place him/her in a nursing home?',
                            data:
                                'An older patient with dementia needs attention and care 24 hours a day especially if the dementia is at an advanced stage. This question will depend on every caregiver, his/her time and emotional ability to deal with the situation. One has to keep in mind caregiver stress and burden that is frequently seen.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title: 'What is caregiver stress/burden?',
                            data:
                                'Alzheimer\'s caregivers frequently report experiencing high levels of stress. It can be overwhelming to take care of a loved one with Alzheimer\'s or other dementia, but too much stress can be harmful to both of you. If you experience signs of stress on a regular basis, consult your doctor. Ignoring symptoms can cause your physical and mental health to decline.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What is the difference between sadness & depression?',
                            data:
                                'Many people confuse sadness & depression, as the primary emotion attached to depression is being sad. However, these are 2 very different emotional states and must be understood as such.\n\nSadness is a normal emotional state, triggered by an event or act that is difficult, hurtful, fearful, or disappointing. Basically, sadness implies there is a cause to be sad about, an outside catalyst that brings about distress. Resolution of this event leads to the person going back to a happy state.\n\nDepression is an abnormal emotional state, where one feels sad about everything. There is a lack of events that may trigger depression; in fact, depressed people often have seemingly perfect lives. A person in a depressed state is not able to enjoy anything, is often irritable, feels fatigued, feels isolated and worthless, is having disturbed sleep, can’t concentrate, and in chronic cases, may have thoughts of suicide.\nIf you or anyone you know is experiencing any of these above symptoms, consult a mental health professional immediately.')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HideShowWidget(
                            title:
                                'What is schizophrenia? How common is it in India?',
                            data:
                                'Schizophrenia is a severe, chronic mental disorder that disrupts a person’s ability to think, feel and behave. The cause of schizophrenia is unknown. It affects more than 1 million people in India and most common in people between 16 to 30 years of age.  \nThe risk factors are genetic history & environmental factors such as malnutrition, psychosocial behavior, exposure to viruses, etc. Some experts believe that around puberty, there is a change in hormones as well as brain chemistry that can trigger the psychotic changes in people who were previously vulnerable. This explains why schizophrenia is mostly seen in adolescents, with very rare cases being reported in children.\n\nSymptoms of schizophrenia are:\n• Visual hallucinations\n• Auditory hallucinations\n• Thought disorders (Unusual way of thinking)\n• Movement disorders (Agitated, repetitive movements)\n• Difficulty recalling things after remembering them\n• Reduced pleasure in life\n• Unable to carry out basic activities\n• Schizophrenia is treated by a combination of anti-psychotics, therapy & family support. While this disease can be treated and contained, it is unlikely that it will be cured. A person with schizophrenia will require treatment lifelong.')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}