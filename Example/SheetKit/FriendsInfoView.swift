//
//  FriendsInfoView.swift
//  SheetKit_Example
//
//  Created by Akaash Dev on 17/11/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit
import SheetKit


class FriendsInfoView: View {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "friends-logo")
        view.clipsToBounds = true
        return view
    }()
    
    private var infoLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = friendsInfoText
        view.font = Font.getMediumFont()
        view.textColor = .labelColor
        view.numberOfLines = 0
        return view
    }()
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(imageView)
        addSubview(infoLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).activate()
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.25).activate()
        imageView.alignHorizontallyCenter()
        imageView.safeTopAnchor(padding: 24)
        
        infoLabel.fillSuperViewWidth(padding: 16)
        infoLabel.placeBelow(view: imageView, padding: 40)
        infoLabel.safeBottomAnchor(padding: -24)
    }
     
}


let friendsInfoText = """
Friends is an American sitcom television series, created by David Crane and Marta Kauffman, which aired on NBC from September 22, 1994, to May 6, 2004, lasting ten seasons.[1] With an ensemble cast starring Jennifer Aniston, Courteney Cox, Lisa Kudrow, Matt LeBlanc, Matthew Perry and David Schwimmer, the show revolved around six friends in their 20s and 30s who lived in Manhattan, New York City. The series was produced by Bright/Kauffman/Crane Productions, in association with Warner Bros. Television. The original executive producers were Kevin S. Bright, Kauffman, and Crane.

Kauffman and Crane began developing Friends under the title Insomnia Cafe between November and December 1993. They presented the idea to Bright, and together they pitched a seven-page treatment of the show to NBC. After several script rewrites and changes, including title changes to Six of One[2] and Friends Like Us, the series was finally named Friends.[3]

Filming of the show took place at Warner Bros. Studios in Burbank, California. All ten seasons of Friends ranked within the top ten of the final television season ratings; it ultimately reached the number-one spot in its eighth season. The series finale aired on May 6, 2004, and was watched by around 52.5 million American viewers, making it the fifth most-watched series finale in television history,[4][5][6] and the most-watched television episode of the 2000s decade.[7][8]

Friends received acclaim throughout its run, becoming one of the most popular television shows of all time.[9] The series was nominated for 62 Primetime Emmy Awards, winning the Outstanding Comedy Series award in 2002[10] for its eighth season. The show ranked no. 21 on TV Guide's 50 Greatest TV Shows of All Time,[11] and no. 7 on Empire magazine's The 50 Greatest TV Shows of All Time.[12][13] In 1997, the episode "The One with the Prom Video" was ranked no. 100 on TV Guide's 100 Greatest Episodes of All-Time.[14] In 2013, Friends ranked no. 24 on the Writers Guild of America's 101 Best Written TV Series of All Time,[15] and no. 28 on TV Guide's 60 Best TV Series of All Time.[16]


In West Village, Rachel Green, a sheltered but friendly woman, flees her wedding day and her rich yet unfulfilling life, and finds childhood friend Monica Geller, a tightly-wound but caring chef. After Rachel becomes a waitress at coffee house Central Perk, she and Monica become roommates at Monica's apartment located directly above Central Perk, and Rachel joins Monica's group of single people in their mid-20s: her previous roommate Phoebe Buffay, an eccentric, innocent masseuse; her neighbor across the hall Joey Tribbiani, a dim-witted yet loyal struggling actor and womanizer; Joey's roommate Chandler Bing, a sarcastic, self-deprecating IT manager; and her older brother and Chandler's college roommate Ross Geller, a sweet-natured but insecure paleontologist.

Episodes depict the friends' comedic and romantic adventures and career issues, such as Joey auditioning for roles or Rachel seeking jobs in the fashion industry. The six characters each have many dates and serious relationships, such as Monica with Richard Burke, and Ross with Emily Waltham. Ross and Rachel's intermittent relationship is the most often-recurring storyline; during the ten seasons of the show, they repeatedly date and break up. Ross briefly marries Emily. Ross and Rachel have a child together after a one-night stand, Chandler and Monica date and marry each other, and Phoebe marries Mike Hannigan. Other frequently recurring characters include Ross and Monica's parents Jack and Judy Geller from Long Island; Ross's ex-wife Carol Willick, their son Ben Geller as well as Carol's wife Susan Bunch; Central Perk barista Gunther; Chandler's ex-girlfriend Janice Goralnik; and Phoebe's twin sister Ursula.


Season 1
Main article: Friends (season 1)
The first season introduces the six main characters: Rachel, Monica, Phoebe, Joey, Chandler, and Ross. Rachel arrives at Central Perk after leaving her fiancé Barry at the altar. She moves into an apartment with her high school friend Monica and takes up a waitressing job at Central Perk. Ross, who has had a crush on Rachel since high school, constantly attempts to declare his feelings for her. However, many obstacles stand in his way, including Rachel dating an Italian neighbour named Paolo, and the fact that he is expecting a baby with his lesbian ex-wife, Carol. She gives birth later in the season and names the child Ben. Joey is a bachelor and struggling actor. Phoebe is working as a masseuse; she is slightly crazy because her mother committed suicide when she was a child. However, the rest of the group loves her regardless. Chandler breaks up with his girlfriend, Janice (Maggie Wheeler), only to find himself reconnecting with her over the course of the series. Near the end of the season, Chandler accidentally reveals that Ross loves Rachel, who then realizes that she feels the same way. The season ends with Rachel waiting at the airport for Ross, who is returning from a trip.

Season 2
Main article: Friends (season 2)
Rachel greets Ross at the airport only to discover that he is dating Julie (Lauren Tom), someone he knew from graduate school. Rachel's attempts to tell Ross she loves him initially mirror his failed attempts in the first season, but the characters do eventually begin a relationship. Monica is fired from her job as chef in the Iridium restaurant for accepting gifts against the company policy and as a result, her savings deteriorate to the point of her having to take an embarrassing job as a waitress at a 50s-style diner. Joey gets cast in a fictional version of the soap opera, Days of Our Lives and soon moves out of his and Chandler's apartment, forcing Chandler to get a new roommate, Eddie (Adam Goldberg). However, Eddie turns out to be an annoying and mentally ill psycopath to Chandler, and Joey's character is killed off after he begins to claim that he writes many of his own lines, bringing him into conflict with the show's writers. With his new apartment being repossessed, Joey moves back in with Chandler, kicking Eddie out in the process. Chandler gets back together with Janice after they both unknowingly chat with each other online. Monica begins dating Richard (Tom Selleck), a recently divorced family friend 21 years her senior, but they eventually break up when Monica realises that she wants kids and he does not.

Season 3
Main article: Friends (season 3)
Season 3 takes on a significantly greater serialized format. Chandler and Janice date for several episodes until Joey catches Janice kissing her soon-to-be ex-husband. Not wanting to destroy her family, Chandler urges Janice to go back to her husband, and becomes depressed over the breakup for several episodes. Rachel quits her job at Central Perk and begins working at Bloomingdale's, an upscale department store chain, and Ross becomes jealous of her colleague, Mark. Rachel decides to take a break from their relationship. Ross, hurt and drunk, sleeps with Chloe, "the hot girl from the Xerox place," causing Rachel to break up with him. Chandler has a hard time dealing with their breakup because it reminds him of his parents' divorce. Although Phoebe initially believes she has no family except her twin sister Ursula (Lisa Kudrow), she becomes acquainted with her half-brother Frank Jr. (Giovanni Ribisi) and birth mother Phoebe Abbott (Teri Garr) over the course of the season. Joey begins a relationship with his acting partner Kate (Dina Meyer), which ends when she receives acting opportunities in Los Angeles. Monica begins a relationship with millionaire Pete Becker (Jon Favreau), despite not initially being attracted to him until they kiss. However, when Pete gets seriously hurt trying to become the Ultimate Fighting Champion, she breaks up with him. Phoebe sets Ross up on a date with her friend Bonnie (Christine Taylor), causing Rachel to get jealous. She tries to sabotage the relationship by coercing Bonnie to shave her head bald, and eventually admits to Ross that she still has feelings for him. The season closes with Ross being forced to choose between Rachel and Bonnie.

Season 4
Main article: Friends (season 4)
In the season 4 premiere, after Ross breaks up with Bonnie, he and Rachel briefly reconcile after Ross pretends to read a long letter that Rachel wrote for him. However, Ross continues to insist that the two were on a break when he slept with Chloe, so they break up again. Joey dates Kathy (Paget Brewster), a girl that Chandler has a crush on. Kathy and Chandler later kiss, which causes drama between Chandler and Joey. Joey only forgives Chandler and allows him to date Kathy after Chandler spends a day in a box as punishment. Chandler's relationship with Kathy ends after discovering she cheated on him due to an argument. Phoebe loses her job as a masseuse after making out with one of her clients and she accompanies Monica who becomes a caterer for hire. They soon start a catering business together but Monica, after negatively reviewing a restaurant, Allesandro's, is offered the position of head chef. Despite initially being pressured by the wrath of her co-workers, Monica eventually asserts her dominance in the kitchen. Phoebe becomes a surrogate mother for her brother and his wife Alice (Debra Jo Rupp). Monica and Rachel are forced to switch apartments with Joey and Chandler after losing a bet during a quiz game, but manage to switch back by bribing them with Knicks season tickets and a one-minute kiss (off-screen) between each other. After her boss dies, Rachel is demoted to personal shopping and meets and later dates a customer named Joshua (Tate Donovan). Ross begins dating an English woman named Emily (Helen Baxendale), and they quickly get engaged. Rachel struggles to cope and hastily suggests Joshua marry her, to which he rejects her. In the season finale, the group, apart from Phoebe and Rachel, travel to Ross and Emily's wedding in London. Chandler and Monica sleep together, and Rachel, realizing that she is still in love with Ross, rushes to London to stop Ross and Emily's wedding, but changes her mind when she sees them happy together. While saying his vows, Ross says Rachel's name at the altar, shocking his bride and the guests.

Season 5
Main article: Friends (season 5)
Ross and Emily marry, but an angry Emily flees the reception. Rachel soon admits her love for Ross, but realizing how ridiculous this is, advises him to work on his marriage to Emily. She develops a crush on her neighbour, Danny, and they date briefly until she realizes that he is too close with his sister. The season features Monica and Chandler trying to keep their new relationship a secret from their friends. Phoebe gives birth to triplets in the show's 100th episode. She gives birth to a boy, Frank Jr. Jr., and two girls, Leslie and Chandler. After weeks of trying to contact her, Emily agrees to reconcile with Ross and move to New York if he breaks off all communication with Rachel. Ross agrees, but later attends a dinner with all his friends, Rachel included. Emily phones Ross, discovers Rachel is there, and realizes she does not trust him, ending their marriage. Ross takes out his anger at work, resulting in him being indefinitely suspended from the museum, and he moves in with Chandler and Joey until eventually getting a new apartment. Rachel acquires a new job at Ralph Lauren. Phoebe begins a relationship with a police officer, Gary (Michael Rapaport), after finding his badge and using it as her own. Monica and Chandler go public with their relationship, to the surprise and delight of their friends. They decide to get married on a trip to Las Vegas, but change their plans after witnessing Ross and Rachel drunkenly stumbling out of the wedding chapel.

Season 6
Main article: Friends (season 6)
In the season 6 premiere, Ross and Rachel's marriage turns out to be a drunken mistake that neither of them remember until pointed out by their friends. Ross secretly tries to get an annulment because he does not want to have had three divorces. An annulment turns out to be impossible because of their history and they are forced to get divorced. Monica and Chandler move in together, causing Rachel to move in with Phoebe. Joey gets a new roommate, Janine (Elle Macpherson), and they realize they have feelings for each other and date briefly until Janine criticises Monica and Chandler. After they break up and Janine moves out, Joey struggles with paying his bills and takes up a job as a waiter at Central Perk. He soon lands a role on a cable television series called Mac and C.H.E.E.S.E., where he stars alongside a robot. Ross gets a job lecturing at New York University and starts dating one of his students, Elizabeth (Alexandra Holden), despite it being against university rules. He seeks the approval of her father Paul (Bruce Willis), only for Rachel and Paul to start dating instead. Both relationships soon end, because Elizabeth is too immature for Ross and Paul is too emotional for Rachel. Phoebe and Rachel's apartment catches fire, and Rachel moves in with Joey, while Phoebe moves in with Chandler and Monica. Chandler proposes to Monica, who says yes even though her ex-boyfriend Richard confesses his love for her.

Season 7
Main article: Friends (season 7)
The seventh season mainly follows Monica and Chandler, who begin to plan their wedding and run into various problems. Joey's television series Mac and C.H.E.E.S.E is cancelled, but he is offered his job back on Days of Our Lives. Phoebe's apartment is rebuilt, but it now has only one large bedroom instead of the original two, so Rachel decides to stay with Joey. Rachel receives a promotion at Ralph Lauren and impulsively hires an assistant, Tag Jones (Eddie Cahill), based on his looks despite being under-qualified. Tag learns that she has feelings for him at Thanksgiving and they start a relationship, keeping it hidden from their co-workers. However, on her 30th birthday Rachel breaks up with him when she realizes that their six-year age difference makes him too young and immature for her to be dating if she intends to follow her marriage schedule. Just prior to Monica and Chandler's wedding, after Chandler goes into hiding, Phoebe and Rachel find a positive pregnancy test in the bathroom of Monica and Chandler's apartment, assuming that it is Monica's. Ross and Phoebe are able to convince Chandler to return for the ceremony, but he briefly bolts out after finding out about the pregnancy test, only to return later considering the idea of fatherhood. Chandler and Monica get married but when he asks her about the pregnancy test, she denies that it is hers; unbeknown to them it turns out that the positive pregnancy test found in their bathroom belongs to Rachel.

Season 8
Main article: Friends (season 8)
Season 8 begins at Monica and Chandler's wedding reception. When Phoebe and Monica find out that Rachel is the one who had the positive pregnancy test, Rachel takes another pregnancy test, which Phoebe initially pretends is negative, in order to find out how Rachel feels about being pregnant. Rachel becomes sad when she thinks she is not pregnant, so Phoebe tells her the truth. Rachel, Phoebe, and Monica then rejoice in the bathroom. The season revolves around Rachel's pregnancy, especially once Ross is revealed to be the father. Rachel and Ross decide to have the baby but do not resume their romantic relationship; Ross soon begins going out with Monica's co-worker, Mona (Bonnie Somerville). Joey takes Rachel out on a date to comfort her due to her pregnancy but ends up developing romantic feelings for her. He struggles with his feelings and encourages Rachel to move in with Ross so he does not miss out on the pregnancy. This results in Mona breaking up with Ross when she finds out, and Joey tells Ross about his feelings for Rachel. Ross initially becomes angry but gives Joey his blessing. Joey tells Rachel that he loves her but she does not reciprocate his feelings; things between them become awkward for a while but they are able to remain friends. Rachel gives birth to baby Emma in the season finale. At the hospital, Ross's mother offers him an engagement ring because she wants him to marry Rachel. Ross does not intend to ask Rachel to marry him, but he takes the ring anyway and puts it in his jacket pocket. While waiting around in the hospital, Monica and Chandler decide to try for a baby. Meanwhile, in the post-delivery room, Joey picks up Ross's jacket while looking for some tissue. The ring falls to the floor. He kneels to pick it up and turns to Rachel, still on his knees and still holding the ring. Rachel accepts what she thinks is his proposal of marriage, while Ross is on his way to her room to ask her if she wants to resume their relationship.

Season 9
Main article: Friends (season 9)
Season nine begins with Ross and Rachel living together as roommates with their daughter Emma, after Joey and Rachel clear up the misunderstanding with the proposal. Monica and Chandler try to have a baby of their own but several obstacles occur: Chandler unknowingly agrees to travel to Tulsa for work; Monica originally intends to go with him but is offered a head chef job at a new restaurant, Javu, resulting in Chandler commuting back and forth between Tulsa and New York every week. Chandler soon quits his job and pursues a career in advertising. He starts at an unpaid internship at the agency, but is soon promoted to junior copywriter. Finally, Monica and Chandler find out that they are physically unable to conceive, and after considering surrogacy and sperm donation, decide to adopt instead. Phoebe begins dating Mike Hannigan (Paul Rudd) for most of the season until Mike tells her that he never wants to marry again. Phoebe soon begins dating her ex-boyfriend from season 1, David (Hank Azaria) and he plans on proposing to her, but when Mike proposes first, Phoebe rejects both proposals but gets back together with Mike, only needing the reassurance that they have a future together. Rachel, believing that her co-worker Gavin (Dermot Mulroney) is trying to steal her job while she is on maternity leave, returns to Ralph Lauren early. She discovers at her birthday party that Gavin has feelings for her and they kiss. However, they decide not to do anything about it due to her history with Ross; but Ross, having seen the kiss, tries to get back at Rachel by dating other women. After realizing that her situation with Ross is too weird, Rachel and Emma move in with Joey, and Rachel develops a crush on him, only to be disheartened when he starts dating Charlie (Aisha Tyler), a new paleontology professor at the university whom Ross has a crush on. The group travels to Barbados in the finale to hear Ross give a keynote speech at a paleontology conference. Joey and Charlie break up upon realizing they have nothing in common, and Joey realizes that Rachel has feelings for him, but says they cannot pursue this because of Ross. However, upon seeing Ross and Charlie kiss each other, he goes to Rachel's hotel room, and the finale ends with the two of them kissing.

Season 10
Main article: Friends (season 10)
The tenth season brings several long-running storylines to a close. Joey and Rachel try to contend with Ross's feelings about their relationship and decide it would be best to remain friends. Charlie breaks up with Ross to get back together with her ex-boyfriend. Phoebe and Mike get married mid-season outside the Central Perk coffee house. Monica and Chandler apply to adopt a child and are chosen by Erica (Anna Faris). Following this, Monica and Chandler prepare to move to a house in the suburbs to raise their family, saddening everyone, including Joey who becomes upset with the changes in his life. In the series finale, Erica gives birth to fraternal twins, to Monica and Chandler's surprise. Rachel gets fired from her job at Ralph Lauren and accepts a new job offer from Louis Vuitton in Paris. Ross tries to get Rachel her job back by secretly meeting with her boss but eventually gives up after realizing that the Paris job is her dream job. When Rachel says a tearful goodbye to everyone but Ross at her going away party, a hurt and angry Ross confronts Rachel, and they end up sleeping together. Rachel leaves, and Ross — who now realizes he is in love with her — chases her to the airport. When he reaches her, Rachel realizes she loves him too, and gets off the plane to reunite with him. The series ends with all the friends, plus Monica and Chandler's new babies, leaving the apartment together for a final cup of coffee. The show ends first with a shot of the keys to Monica and Chandler's apartment, on the counter table, and then with a shot of the apartment's purple door.
"""
