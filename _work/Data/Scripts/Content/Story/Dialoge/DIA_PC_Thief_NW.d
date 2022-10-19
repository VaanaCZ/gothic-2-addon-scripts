
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_DiegoNW_EXIT(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 999;
	condition	= DIA_DiegoNW_EXIT_Condition;
	information	= DIA_DiegoNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_DiegoNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//######################################
//##
//##	Permanent Info
//##
//######################################


// ************************************************************
// 	  	  Wie laufen die Geschäfte? (perm)
// ************************************************************

INSTANCE DIA_DiegoNW_Perm(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 998;
	condition	= DIA_DiegoNW_Perm_Condition;
	information	= DIA_DiegoNW_Perm_Info;
	permanent	= TRUE;

	description = "Jak idzie interes?";
};                       
FUNC INT DIA_DiegoNW_Perm_Condition()
{
	if (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_00"); //Jak ci siê ¿yje na wolnoœci?
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_01"); //Kiepsko. Nikt mi nie powiedzia³, ¿e pod moj¹ nieobecnoœæ Khorinis zesz³o na psy.
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_02"); //No nie wiem. Dla mnie to miasto zawsze takie by³o.
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_03"); //To powinieneœ je zobaczyæ parê lat temu. Spodoba³oby ci siê.
};


//######################################
//##
//##	Kapitel 3
//##
//######################################

// ************************************************************
// 	  	  Ich brauche deine Hilfe.
// ************************************************************

INSTANCE DIA_DiegoNW_NeedHelp(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 1;
	condition	= DIA_DiegoNW_NeedHelp_Condition;
	information	= DIA_DiegoNW_NeedHelp_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_DiegoNW_NeedHelp_Condition()
{
	if (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_NeedHelp_Info()
{	
	if (Diego_IsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_01"); //Co siê tak dziwisz?
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_02"); //Naprawdê s¹dzi³eœ, ¿e nie ¿yjê?
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_03"); //Na jakiœ czas straci³em przytomnoœæ, ale - jak widzisz - ¿yjê i mam siê ca³kiem dobrze.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_04"); //Teraz liczy siê to, ¿e jesteœmy tu obaj...
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_05"); //I to, ¿e potrzeba mi twojej pomocy.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_11_00"); //Dobrze, ¿e ciê widzê. Musisz mi pomóc.
	};
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	
	if (DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	//	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Wer bist du?",DIA_DiegoNW_NeedHelp_WhoAreYou);//Joly:macht keinen Sinn. Ohne mit Diego gesprochen zu haben -> Kein DiegoNW !! Hauptstory Kapitel 2 OW!!!!
	};
	
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co to za strój?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co tu porabiasz?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"W czym rzecz?",DIA_DiegoNW_NeedHelp_Problem);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Plan_15_00"); //Co tu robisz?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_01"); //Obserwujê stra¿ników. Bez przerwy wêsz¹.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_02"); //Nie³atwo bêdzie przeœlizgn¹æ siê têdy.
};

FUNC VOID DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00"); //Kim jesteœ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01"); //Cholera, to pewnie przez ten strój. Stra¿nicy nie chc¹ mnie wpuœciæ do miasta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02"); //Dlatego w³aœnie kupi³em te szaty od napotkanego handlarza. Teraz chyba sobie mnie przypominasz? To ja - Diego!
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03"); //Za Barier¹ nauczy³em ciê wszystkiego, co pomog³o ci w przetrwaniu.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04"); //Chyba nie mog³eœ tego zapomnieæ?
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05"); //Hmmm... Mo¿esz mi powiedzieæ, co siê wtedy sta³o?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06"); //Jasna cholera! Ty naprawdê nic nie pamiêtasz?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07"); //S³uchaj, nie mam teraz czasu, ¿eby ci to wszystko wyjaœniæ. Musisz wiedzieæ tylko tyle: byliœmy wtedy dobrymi kumplami i parê razy uratowa³em ci ¿ycie.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08"); //A teraz potrzebujê twojej pomocy.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_00"); //Co to za strój?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01"); //Kupi³em go od napotkanego handlarza. Stra¿nicy nie chcieli mnie wpuœciæ do miasta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02"); //Poza tym, nie chcê, ¿eby ca³y œwiat wiedzia³, sk¹d wracam.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_03"); //Nieg³upi pomys³.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04"); //Te¿ tak myœlê. Ale chocia¿ pozby³em siê stroju Cienia, nadal jestem tym, kim by³em w Kolonii.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05"); //I wi¹¿ê z tym miastem wielkie plany.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_00"); //W czym rzecz?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_01"); //Du¿o siê tu pozmienia³o od mojej ostatniej wizyty. Najpierw muszê jakoœ stan¹æ na nogi.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_02"); //Ale w czym problem?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_03"); //Muszê siê dostaæ do górnego miasta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_04"); //Ale nie jestem mieszkañcem, a nie mam doœæ z³ota, by przekupiæ stra¿ników. I tu wkraczasz TY!
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_05"); //Mam ci po¿yczyæ trochê z³ota?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_06"); //W ¿adnym wypadku! Mam trochê pieniêdzy... ca³kiem sporo, jeœli mam byæ szczery. Niestety, nie mam ich przy sobie.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_07"); //Ktoœ musi mi je przynieœæ. Rozumiemy siê?
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Obawiam siê, ¿e nie mam na to czasu.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"A co JA bêdê z tego mia³?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"W porz¹dku, pomogê ci.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00"); //Obawiam siê, ¿e nie mam na to czasu.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01"); //Hej, myœla³em, ¿e jesteœmy kumplami! Nie wiem, czy pamiêtasz, ale to JA uratowa³em twój ty³ek, gdy wyl¹dowa³eœ w Kolonii.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02"); //Chyba trochê przesadzasz.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03"); //O, czy¿by? No to zastanów siê, co by siê z tob¹ sta³o, gdybym nie wyjaœni³ ci, kto jest kim, i jak siê zachowywaæ za Barier¹.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04"); //Magnaci zjedliby ciê na œniadanie! Skoñczy³byœ w zawszonej kopalni!

	MIS_HelpDiegoNW = LOG_FAILED;
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00"); //A co bêdê z tego mia³?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01"); //A czy ja ciê prosi³em o coœ w zamian za moj¹ pomoc? Jesteœmy przyjació³mi. To ci nie wystarczy?
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00"); //W porz¹dku, pomogê ci.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01"); //S³uchaj. Gdy Bariera nadal istnia³a, ukry³em sobie ma³y skarb.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02"); //To by³o dawno temu, wiêc zapomnia³em go ze sob¹ zabraæ.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03"); //Teraz nie mogê siê st¹d ruszyæ...
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03"); //¯eby nie przed³u¿aæ: musisz pójœæ do Górniczej Doliny i odzyskaæ moje z³oto.

	MIS_HelpDiegoNW = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"Z³oto Diega znajduje siê w Górniczej Dolinie. Diego potrzebuje go, aby dostaæ siê do górnego miasta, i prosi³ mnie o jego przyniesienie.");
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co zamierzasz zrobiæ z pieniêdzmi?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Sk¹d wzi¹³eœ to ca³e z³oto?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Gdzie schowa³eœ z³oto?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00"); //Co zamierzasz zrobiæ z pieniêdzmi?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01"); //Muszê siê rozliczyæ z jednym kupcem z górnego miasta. Tym zajmê siê w pierwszej kolejnoœci.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02"); //A potem rozpocznie siê moja nowa kariera!
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00"); //Sk¹d wzi¹³eœ to ca³e z³oto?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01"); //Czy¿bym by³ jedynym, który uciu³a³ sobie trochê pieniêdzy w Górniczej Dolinie?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02"); //Od³o¿enie na bok paru sztuk z³ota by³o dziecinnie ³atwe. No wiesz, na wypadek, gdybyœmy siê stamt¹d wydostali.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03"); //Wszyscy szaleli za rud¹, nikogo nie obchodzi³o z³oto. 
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00"); //Gdzie schowa³eœ z³oto?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01"); //Na placu wymian, nad opuszczon¹ kopalni¹, w skórzanej torbie.
	if (Diego_angekommen == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01"); //Nie musisz komentowaæ - dobrze wiem, ¿e nie zauwa¿yliœmy tego na czas.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02"); //Zdob¹dŸ torbê i mi j¹ przynieœ.
	};
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02"); //Tylko upewnij siê, ¿e to ta w³aœciwa, ¿ebyœ nie musia³ chodziæ dwa razy.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03"); //Jak j¹ rozpoznam?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04"); //Torba jest pe³na z³ota. Wypchana po brzegi!
					
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Dobrze, spróbujê znaleŸæ twój skarb.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);		
	
	B_LogEntry (TOPIC_HelpDiegoNW,"Z³oto Diega znajduje siê gdzieœ na starym placu wymian, nad opuszczon¹ kopalni¹ - tam, gdzie dostarczano za pomoc¹ kolejki linowej ca³e zaopatrzenie dla Kolonii.");
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00"); //Dobrze, spróbujê znaleŸæ twój skarb.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01"); //Tak trzymaæ! To mi wystarczy.

	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

//***********************************************
//	Ok, ich werde dir doch helfen.
//***********************************************

INSTANCE DIA_DiegoNW_HelpYou(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 30;
	condition	= DIA_DiegoNW_HelpYou_Condition;
	information	= DIA_DiegoNW_HelpYou_Info;
	permanent	= FALSE;
	description	= "W porz¹dku, jednak ci pomogê.";
};                       
FUNC INT DIA_DiegoNW_HelpYou_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (MIS_HElpDiegoNW == LOG_FAILED) 
	&& (Diego_IsOnBOard != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_HelpYou_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_00"); //W porz¹dku, jednak ci pomogê.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_01"); //Wiedzia³em, ¿e tak bêdzie.
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_02"); //PrzejdŸmy od razu do rzeczy, dobrze?
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_03"); //Jasne. Ukry³em w Górniczej Dolinie pokaŸn¹ sumê pieniêdzy i chcê, ¿ebyœ je dla mnie odzyska³.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_06"); //Ja zostanê tutaj i w miêdzyczasie wszystko przygotujê.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();

	MIS_HelpDiegoNW = LOG_RUNNING;
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"Z³oto Diega znajduje siê w Górniczej Dolinie. Diego potrzebuje go, aby dostaæ siê do górnego miasta, i prosi³ mnie o jego przyniesienie.");
};

//***********************************************
//	Ich habe dein Gold gefunden!
//***********************************************

INSTANCE DIA_DiegoNW_HaveYourGold(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 31;
	condition	= DIA_DiegoNW_HaveYourGold_Condition;
	information	= DIA_DiegoNW_HaveYourGold_Info;
	permanent	= TRUE;
	description	= "Znalaz³em twoje z³oto!";
};            

FUNC INT DIA_DiegoNW_HaveYourGold_Condition()
{
	if ((OpenedDiegosBag == TRUE)
	|| (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1))
	&& (MIS_HelpDiegoNW == LOG_RUNNING)
	&& (Diego_IsOnBOard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID B_DIEGONW_DIEGOSREVENGE ()
{
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_05"); //Œwietnie. Gerbrandt mo¿e siê zacz¹æ pakowaæ.
};

var int DiegosRevenge;

FUNC VOID DIA_DiegoNW_HaveYourGold_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HaveYourGold_15_00"); //Znalaz³em twoje z³oto!
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_01"); //Œwietnie. Poka¿!
	
	IF (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1)
	{
		B_GiveInvItems (other,self ,ItSe_DiegosTreasure_Mis,1);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	}
	else if (Npc_HasItems (other,ItMi_Gold < DiegosTreasure))
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_02"); //Ale to jeszcze nie wszystko! Nie ufasz mi? Potrzebujê ca³ej sumy!
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_03"); //Jeœli mój plan wypali, zostanie dla ciebie wystarczaj¹co du¿o.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_04"); //Ale najpierw muszê dostaæ wszystko, co do grosza. To bardzo wa¿ne!
	}
	else
	{
		B_GiveInvItems (other,self ,ItMi_Gold,DiegosTreasure);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	};	
	
	if (Npc_IsDead (Gerbrandt) == FALSE)
	&& (DiegosRevenge == TRUE)
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_06"); //S³uchaj, muszê siê teraz zaj¹æ stra¿nikami.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_07"); //Chcê, ¿ebyœ zaniós³ ten list Gerbrandtowi. To jeden z bogatych kupców z górnego miasta.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_08"); //Przeka¿ mu moje pozdrowienia. Spotkamy siê przed jego domem.

		CreateInvItems (self ,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems (self,other,ItWr_DiegosLetter_MIS,1);
		
		B_StartOtherRoutine (Gerbrandt,"WaitForDiego");
		
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_RUNNING;
		B_GivePlayerXP (XP_HelpDiegoNW);

		Log_CreateTopic (TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_DiegosResidence,LOG_RUNNING);
		B_LogEntry (TOPIC_DiegosResidence,"Diego da³ mi list dla kupca Gerbrandta.");
		
		AI_StopProcessInfos (self);
	};		
		
	
};


//***********************************************
//	Ich habe den Brief abgeliefert.
//***********************************************

INSTANCE DIA_DiegoNW_DeliveredLetter(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 30;
	condition	= DIA_DiegoNW_DeliveredLetter_Condition;
	information	= DIA_DiegoNW_DeliveredLetter_Info;
	permanent	= FALSE;
	description	= "Dostarczy³em twój list.";
};
                       
FUNC INT DIA_DiegoNW_DeliveredLetter_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (MIS_DiegosResidence == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Info()
{
		
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_00"); //Dostarczy³em twój list.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_01"); //Œwietnie. I jak zareagowa³ Gerbrandt?
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_02"); //Wydawa³ siê bardzo przestraszony i natychmiast znikn¹³.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_03"); //No, ja myœlê.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_04"); //Obawiam siê, ¿e najpierw muszê poœwiêciæ trochê czasu na urz¹dzenie mojego nowego domu. Jeœli dobrze pamiêtam, Gerbrandt ma fatalny gust.
	  
	B_GivePlayerXP (XP_DiegoHasANewHome);

	Wld_AssignRoomToGuild ("reich01",		GIL_PUBLIC);

	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Jak tego dokona³eœ?",DIA_DiegoNW_DeliveredLetter_YourTrick);	
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"A wiêc dom jest twój?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Gerbrandt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00"); //Co siê sta³o z Gerbrandtem?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01"); //Zbyt d³ugo cieszy³ siê ¿yciem w luksusie.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02"); //Mieszka³ sobie tutaj, op³ywaj¹c w dostatki, podczas gdy ja za¿era³em siê gulaszem z chrz¹szczy.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03"); //Nie wiem, dok¹d uciek³, ale jego noga nigdy wiêcej nie postanie w Khorinis. Ju¿ ja siê o to postaram.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04"); //Jeœli koniecznie chcesz go znaleŸæ, popytaj w okolicach przystani.
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00"); //A wiêc dom jest twój?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01"); //Tak! Od piwnicy a¿ po strych, z ca³ym wyposa¿eniem.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02"); //Po spêdzeniu tylu lat w niezbyt komfortowych, wiêziennych warunkach, zamierzam wreszcie wyspaæ siê porz¹dnie na miêkkim ³ó¿ku.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03"); //A na œniadanie bêdzie kawa³ prawdziwego miêsa i dobre wino!
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04"); //NieŸle to sobie zaplanowa³eœ, co?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05"); //¯ebyœ wiedzia³!
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00"); //Jak tego dokona³eœ?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01"); //Myœlisz, ¿e Gerbrandt doszed³ do swojej fortuny w ci¹gu wielu lat uczciwej pracy?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02"); //Oczywiœcie on sam nie macza³ palców w szczególnie œliskich sprawach. Mia³ do tego specjalnego pomocnika.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03"); //Si³¹ rzeczy poznawa³em szczegó³y jego brudnych machlojek, a¿ postanowi³ pozbyæ siê mnie na dobre. Za du¿o wiedzia³em.
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04"); //Nigdy mi o tym nie mówi³eœ.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05"); //Nigdy mnie o to nie pyta³eœ.
	
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,DIALOG_BACK,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"A co z moj¹ dzia³k¹?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Co siê sta³o z Gerbrandtem?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
}; 

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{

	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00"); //A co z moj¹ dzia³k¹?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01"); //Widzê, ¿e jednak nie zapomnia³eœ wszystkiego, czego ciê nauczy³em.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02"); //Ale masz racjê. Bez ciebie nigdy by mi siê nie uda³o. Oto twoja czêœæ.
	
	CreateInvItems (self ,ItMi_Gold,500);
	B_GiveInvItems (self,other,ItMi_Gold,500);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
};


// ************************************************************
// 	  	  Kannst du mir was beibringen?
// ************************************************************

//---------------------------
var int Diego_Teach;
//---------------------------

INSTANCE DIA_DiegoNW_CanYouTeach(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 995;
	condition	= DIA_DiegoNW_CanYouTeach_Condition;
	information	= DIA_DiegoNW_CanYouTeach_Info;
	permanent	= TRUE;

	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       
FUNC INT DIA_DiegoNW_CanYouTeach_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_CanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_CanYouTeach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	if (Npc_KnowsInfo (other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_01"); //Jasne. Daj znaæ, jak bêdziesz gotowy.
		
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_02"); //Mam najpierw parê spraw do za³atwienia.
	};
};



// ************************************************************
// 	  	  Bring mir was bei.
// ************************************************************

//-----------------------
var int DiegoNW_Merke_DEX;
//-------------------------

INSTANCE DIA_DiegoNW_Teach(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 995;
	condition	= DIA_DiegoNW_Teach_Condition;
	information	= DIA_DiegoNW_Teach_Info;
	permanent	= TRUE;

	description = "Naucz mnie.";
};                       
FUNC INT DIA_DiegoNW_Teach_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_Teach_15_00"); //Naucz mnie czegoœ.
	AI_Output (self ,other,"DIA_DiegoNW_Teach_11_01"); //Mogê popracowaæ trochê nad twoj¹ zrêcznoœci¹.
	
	DiegoNW_Merke_Dex = other.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if (DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_DiegoNW_Teach_BACK_11_00"); //Ju¿ jesteœ bardziej zrêczny. Tak trzymaæ.
	};
	Info_ClearChoices	(DIA_DiegoNW_Teach);
};

// ------ 1 Geschick -----
func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);

	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

// ------ 5 Geschick ------
func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

//######################################
//##
//##	Kapitel 5
//##
//######################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_DiegoNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Zamierzam opuœciæ Khorinis.";
};

func int DIA_DiegoNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_DiegoNW_KnowWhereEnemy_15_00"); //Zamierzam opuœciæ Khorinis.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_01"); //M¹dra decyzja. Chêtnie zabra³bym siê z tob¹. To miasto za bardzo siê zmieni³o. Ciê¿ko bêdzie tutaj szybko siê wzbogaciæ.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_02"); //Móg³bym ciê podszkoliæ w ³ucznictwie, otwieraniu zamków i zrêcznoœci.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_03"); //No i przyda ci siê chyba dobry z³odziej?
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry (TOPIC_Crew,"Oczywiœcie, Diego chce mi towarzyszyæ. Uwa¿a, ¿e im szybciej opuœci Khorinis, tym lepiej. Móg³by mi pokazaæ, jak zwiêkszyæ zrêcznoœæ, i przeszkoliæ mnie w pos³ugiwaniu siê ³ukiem oraz otwieraniu zamków.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_DiegoNW_KnowWhereEnemy_15_04"); //Zastanowiê siê nad tym. W tej chwili mam ju¿ prawie ca³¹ za³ogê.
		AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_05"); //Nie musisz siê spieszyæ. Nigdzie siê nie wybieram.
	}
	else 
	{
		Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Szczegó³y poznasz, gdy nadejdzie odpowiednia pora.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Nie chcesz iœæ ze mn¹?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00"); //Pop³yñ ze mn¹. Mo¿emy siê spotkaæ na przystani.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01"); //Hmmm... Masz racjê. Khorinis to rynsztok. P³ynê z tob¹!
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02"); //Daj mi jedn¹ chwilê. Zaraz bêdê gotowy.
		AI_SetWalkmode 	(self, NPC_WALK);		
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_Wait (self ,1);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03"); //Mogê ju¿ ruszaæ. Do zobaczenia na statku!
	
	
	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};

	Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_No_15_00"); //Mo¿e dam ci znaæ, gdy nadejdzie odpowiednia chwila.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01"); //Tak zrób. Kto wie? Mo¿e nawet z tob¹ pop³ynê?

	Diego_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_LeaveMyShip_Condition;
	information	 = 	DIA_DiegoNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Mo¿esz ju¿ wracaæ do miasta.";
};
func int DIA_DiegoNW_LeaveMyShip_Condition ()
{	
	if (Diego_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_DiegoNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_00"); //Mo¿esz ju¿ wracaæ do miasta.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_01"); //Serio? Nie potrzebujesz mnie? Jak chcesz. Jak wrócisz do miasta, zajrzyj do mnie koniecznie.
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_02"); //Myœlisz, ¿e siê jeszcze kiedyœ spotkamy?
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_03"); //Nigdy nie zapomnê wyrazu twojej twarzy podczas naszego pierwszego spotkania, gdy Bullit powali³ ciê na ziemiê.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_04"); //Takich jak ty nie mo¿na pokonaæ. Jeszcze siê spotkamy. Bywaj!
	
	
	Diego_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_StillNeedYou_Condition;
	information	 = 	DIA_DiegoNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"ChodŸ ze mn¹. Chcê, ¿ebyœ mi towarzyszy³.";
};

func int DIA_DiegoNW_StillNeedYou_Condition ()
{	
	if ((Diego_IsOnBOard == LOG_OBSOLETE)	
	|| (Diego_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_DiegoNW_StillNeedYou_15_00"); //ChodŸ ze mn¹. Chcê, ¿ebyœ mi towarzyszy³.
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_01"); //Gdzie siê podzia³a twoja pewnoœæ siebie, przyjacielu? Jasne, pójdê z tob¹. Tylko siê wreszcie zdecyduj!
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_StillNeedYou_11_02"); //Czekaj, za chwilê bêdê gotowy.
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_03"); //Dobra, mo¿emy iœæ.
	
	AI_StopProcessInfos (self);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thief_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 900;
	condition	= DIA_Thief_NW_PICKPOCKET_Condition;
	information	= DIA_Thief_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Thief_NW_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_Thief_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Thief_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thief_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thief_NW_PICKPOCKET);
};
	
func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thief_NW_PICKPOCKET);
};


