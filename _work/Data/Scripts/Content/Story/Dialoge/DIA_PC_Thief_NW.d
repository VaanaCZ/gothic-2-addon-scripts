
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
// 	  	  Wie laufen die Gesch�fte? (perm)
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
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_00"); //Jak ci si� �yje na wolno�ci?
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_01"); //Kiepsko. Nikt mi nie powiedzia�, �e pod moj� nieobecno�� Khorinis zesz�o na psy.
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_02"); //No nie wiem. Dla mnie to miasto zawsze takie by�o.
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_03"); //To powiniene� je zobaczy� par� lat temu. Spodoba�oby ci si�.
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
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_01"); //Co si� tak dziwisz?
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_02"); //Naprawd� s�dzi�e�, �e nie �yj�?
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_03"); //Na jaki� czas straci�em przytomno��, ale - jak widzisz - �yj� i mam si� ca�kiem dobrze.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_04"); //Teraz liczy si� to, �e jeste�my tu obaj...
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_05"); //I to, �e potrzeba mi twojej pomocy.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_11_00"); //Dobrze, �e ci� widz�. Musisz mi pom�c.
	};
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	
	if (DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	//	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Wer bist du?",DIA_DiegoNW_NeedHelp_WhoAreYou);//Joly:macht keinen Sinn. Ohne mit Diego gesprochen zu haben -> Kein DiegoNW !! Hauptstory Kapitel 2 OW!!!!
	};
	
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co to za str�j?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co tu porabiasz?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"W czym rzecz?",DIA_DiegoNW_NeedHelp_Problem);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Plan_15_00"); //Co tu robisz?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_01"); //Obserwuj� stra�nik�w. Bez przerwy w�sz�.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_02"); //Nie�atwo b�dzie prze�lizgn�� si� t�dy.
};

FUNC VOID DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00"); //Kim jeste�?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01"); //Cholera, to pewnie przez ten str�j. Stra�nicy nie chc� mnie wpu�ci� do miasta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02"); //Dlatego w�a�nie kupi�em te szaty od napotkanego handlarza. Teraz chyba sobie mnie przypominasz? To ja - Diego!
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03"); //Za Barier� nauczy�em ci� wszystkiego, co pomog�o ci w przetrwaniu.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04"); //Chyba nie mog�e� tego zapomnie�?
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05"); //Hmmm... Mo�esz mi powiedzie�, co si� wtedy sta�o?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06"); //Jasna cholera! Ty naprawd� nic nie pami�tasz?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07"); //S�uchaj, nie mam teraz czasu, �eby ci to wszystko wyja�ni�. Musisz wiedzie� tylko tyle: byli�my wtedy dobrymi kumplami i par� razy uratowa�em ci �ycie.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08"); //A teraz potrzebuj� twojej pomocy.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_00"); //Co to za str�j?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01"); //Kupi�em go od napotkanego handlarza. Stra�nicy nie chcieli mnie wpu�ci� do miasta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02"); //Poza tym, nie chc�, �eby ca�y �wiat wiedzia�, sk�d wracam.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_03"); //Nieg�upi pomys�.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04"); //Te� tak my�l�. Ale chocia� pozby�em si� stroju Cienia, nadal jestem tym, kim by�em w Kolonii.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05"); //I wi��� z tym miastem wielkie plany.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_00"); //W czym rzecz?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_01"); //Du�o si� tu pozmienia�o od mojej ostatniej wizyty. Najpierw musz� jako� stan�� na nogi.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_02"); //Ale w czym problem?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_03"); //Musz� si� dosta� do g�rnego miasta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_04"); //Ale nie jestem mieszka�cem, a nie mam do�� z�ota, by przekupi� stra�nik�w. I tu wkraczasz TY!
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_05"); //Mam ci po�yczy� troch� z�ota?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_06"); //W �adnym wypadku! Mam troch� pieni�dzy... ca�kiem sporo, je�li mam by� szczery. Niestety, nie mam ich przy sobie.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_07"); //Kto� musi mi je przynie��. Rozumiemy si�?
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Obawiam si�, �e nie mam na to czasu.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"A co JA b�d� z tego mia�?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"W porz�dku, pomog� ci.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00"); //Obawiam si�, �e nie mam na to czasu.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01"); //Hej, my�la�em, �e jeste�my kumplami! Nie wiem, czy pami�tasz, ale to JA uratowa�em tw�j ty�ek, gdy wyl�dowa�e� w Kolonii.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02"); //Chyba troch� przesadzasz.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03"); //O, czy�by? No to zastan�w si�, co by si� z tob� sta�o, gdybym nie wyja�ni� ci, kto jest kim, i jak si� zachowywa� za Barier�.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04"); //Magnaci zjedliby ci� na �niadanie! Sko�czy�by� w zawszonej kopalni!

	MIS_HelpDiegoNW = LOG_FAILED;
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00"); //A co b�d� z tego mia�?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01"); //A czy ja ci� prosi�em o co� w zamian za moj� pomoc? Jeste�my przyjaci�mi. To ci nie wystarczy?
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00"); //W porz�dku, pomog� ci.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01"); //S�uchaj. Gdy Bariera nadal istnia�a, ukry�em sobie ma�y skarb.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02"); //To by�o dawno temu, wi�c zapomnia�em go ze sob� zabra�.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03"); //Teraz nie mog� si� st�d ruszy�...
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03"); //�eby nie przed�u�a�: musisz p�j�� do G�rniczej Doliny i odzyska� moje z�oto.

	MIS_HelpDiegoNW = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"Z�oto Diega znajduje si� w G�rniczej Dolinie. Diego potrzebuje go, aby dosta� si� do g�rnego miasta, i prosi� mnie o jego przyniesienie.");
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co zamierzasz zrobi� z pieni�dzmi?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Sk�d wzi��e� to ca�e z�oto?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Gdzie schowa�e� z�oto?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00"); //Co zamierzasz zrobi� z pieni�dzmi?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01"); //Musz� si� rozliczy� z jednym kupcem z g�rnego miasta. Tym zajm� si� w pierwszej kolejno�ci.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02"); //A potem rozpocznie si� moja nowa kariera!
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00"); //Sk�d wzi��e� to ca�e z�oto?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01"); //Czy�bym by� jedynym, kt�ry uciu�a� sobie troch� pieni�dzy w G�rniczej Dolinie?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02"); //Od�o�enie na bok paru sztuk z�ota by�o dziecinnie �atwe. No wiesz, na wypadek, gdyby�my si� stamt�d wydostali.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03"); //Wszyscy szaleli za rud�, nikogo nie obchodzi�o z�oto. 
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00"); //Gdzie schowa�e� z�oto?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01"); //Na placu wymian, nad opuszczon� kopalni�, w sk�rzanej torbie.
	if (Diego_angekommen == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01"); //Nie musisz komentowa� - dobrze wiem, �e nie zauwa�yli�my tego na czas.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02"); //Zdob�d� torb� i mi j� przynie�.
	};
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02"); //Tylko upewnij si�, �e to ta w�a�ciwa, �eby� nie musia� chodzi� dwa razy.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03"); //Jak j� rozpoznam?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04"); //Torba jest pe�na z�ota. Wypchana po brzegi!
					
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Dobrze, spr�buj� znale�� tw�j skarb.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);		
	
	B_LogEntry (TOPIC_HelpDiegoNW,"Z�oto Diega znajduje si� gdzie� na starym placu wymian, nad opuszczon� kopalni� - tam, gdzie dostarczano za pomoc� kolejki linowej ca�e zaopatrzenie dla Kolonii.");
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00"); //Dobrze, spr�buj� znale�� tw�j skarb.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01"); //Tak trzyma�! To mi wystarczy.

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
	description	= "W porz�dku, jednak ci pomog�.";
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
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_00"); //W porz�dku, jednak ci pomog�.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_01"); //Wiedzia�em, �e tak b�dzie.
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_02"); //Przejd�my od razu do rzeczy, dobrze?
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_03"); //Jasne. Ukry�em w G�rniczej Dolinie poka�n� sum� pieni�dzy i chc�, �eby� je dla mnie odzyska�.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_06"); //Ja zostan� tutaj i w mi�dzyczasie wszystko przygotuj�.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();

	MIS_HelpDiegoNW = LOG_RUNNING;
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"Z�oto Diega znajduje si� w G�rniczej Dolinie. Diego potrzebuje go, aby dosta� si� do g�rnego miasta, i prosi� mnie o jego przyniesienie.");
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
	description	= "Znalaz�em twoje z�oto!";
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
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_05"); //�wietnie. Gerbrandt mo�e si� zacz�� pakowa�.
};

var int DiegosRevenge;

FUNC VOID DIA_DiegoNW_HaveYourGold_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HaveYourGold_15_00"); //Znalaz�em twoje z�oto!
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_01"); //�wietnie. Poka�!
	
	IF (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1)
	{
		B_GiveInvItems (other,self ,ItSe_DiegosTreasure_Mis,1);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	}
	else if (Npc_HasItems (other,ItMi_Gold < DiegosTreasure))
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_02"); //Ale to jeszcze nie wszystko! Nie ufasz mi? Potrzebuj� ca�ej sumy!
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_03"); //Je�li m�j plan wypali, zostanie dla ciebie wystarczaj�co du�o.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_04"); //Ale najpierw musz� dosta� wszystko, co do grosza. To bardzo wa�ne!
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
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_06"); //S�uchaj, musz� si� teraz zaj�� stra�nikami.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_07"); //Chc�, �eby� zani�s� ten list Gerbrandtowi. To jeden z bogatych kupc�w z g�rnego miasta.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_08"); //Przeka� mu moje pozdrowienia. Spotkamy si� przed jego domem.

		CreateInvItems (self ,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems (self,other,ItWr_DiegosLetter_MIS,1);
		
		B_StartOtherRoutine (Gerbrandt,"WaitForDiego");
		
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_RUNNING;
		B_GivePlayerXP (XP_HelpDiegoNW);

		Log_CreateTopic (TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_DiegosResidence,LOG_RUNNING);
		B_LogEntry (TOPIC_DiegosResidence,"Diego da� mi list dla kupca Gerbrandta.");
		
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
	description	= "Dostarczy�em tw�j list.";
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
		
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_00"); //Dostarczy�em tw�j list.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_01"); //�wietnie. I jak zareagowa� Gerbrandt?
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_02"); //Wydawa� si� bardzo przestraszony i natychmiast znikn��.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_03"); //No, ja my�l�.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_04"); //Obawiam si�, �e najpierw musz� po�wi�ci� troch� czasu na urz�dzenie mojego nowego domu. Je�li dobrze pami�tam, Gerbrandt ma fatalny gust.
	  
	B_GivePlayerXP (XP_DiegoHasANewHome);

	Wld_AssignRoomToGuild ("reich01",		GIL_PUBLIC);

	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Jak tego dokona�e�?",DIA_DiegoNW_DeliveredLetter_YourTrick);	
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"A wi�c dom jest tw�j?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Gerbrandt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00"); //Co si� sta�o z Gerbrandtem?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01"); //Zbyt d�ugo cieszy� si� �yciem w luksusie.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02"); //Mieszka� sobie tutaj, op�ywaj�c w dostatki, podczas gdy ja za�era�em si� gulaszem z chrz�szczy.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03"); //Nie wiem, dok�d uciek�, ale jego noga nigdy wi�cej nie postanie w Khorinis. Ju� ja si� o to postaram.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04"); //Je�li koniecznie chcesz go znale��, popytaj w okolicach przystani.
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00"); //A wi�c dom jest tw�j?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01"); //Tak! Od piwnicy a� po strych, z ca�ym wyposa�eniem.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02"); //Po sp�dzeniu tylu lat w niezbyt komfortowych, wi�ziennych warunkach, zamierzam wreszcie wyspa� si� porz�dnie na mi�kkim ��ku.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03"); //A na �niadanie b�dzie kawa� prawdziwego mi�sa i dobre wino!
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04"); //Nie�le to sobie zaplanowa�e�, co?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05"); //�eby� wiedzia�!
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00"); //Jak tego dokona�e�?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01"); //My�lisz, �e Gerbrandt doszed� do swojej fortuny w ci�gu wielu lat uczciwej pracy?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02"); //Oczywi�cie on sam nie macza� palc�w w szczeg�lnie �liskich sprawach. Mia� do tego specjalnego pomocnika.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03"); //Si�� rzeczy poznawa�em szczeg�y jego brudnych machlojek, a� postanowi� pozby� si� mnie na dobre. Za du�o wiedzia�em.
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04"); //Nigdy mi o tym nie m�wi�e�.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05"); //Nigdy mnie o to nie pyta�e�.
	
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,DIALOG_BACK,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"A co z moj� dzia�k�?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Co si� sta�o z Gerbrandtem?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
}; 

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{

	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00"); //A co z moj� dzia�k�?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01"); //Widz�, �e jednak nie zapomnia�e� wszystkiego, czego ci� nauczy�em.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02"); //Ale masz racj�. Bez ciebie nigdy by mi si� nie uda�o. Oto twoja cz��.
	
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

	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output (other,self ,"DIA_DiegoNW_CanYouTeach_15_00"); //Mo�esz mnie czego� nauczy�?
	if (Npc_KnowsInfo (other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_01"); //Jasne. Daj zna�, jak b�dziesz gotowy.
		
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_02"); //Mam najpierw par� spraw do za�atwienia.
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
	AI_Output (other,self ,"DIA_DiegoNW_Teach_15_00"); //Naucz mnie czego�.
	AI_Output (self ,other,"DIA_DiegoNW_Teach_11_01"); //Mog� popracowa� troch� nad twoj� zr�czno�ci�.
	
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
		AI_Output (self, other, "DIA_DiegoNW_Teach_BACK_11_00"); //Ju� jeste� bardziej zr�czny. Tak trzyma�.
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
	description	 = 	"Zamierzam opu�ci� Khorinis.";
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
	AI_Output			(other, self, "DIA_DiegoNW_KnowWhereEnemy_15_00"); //Zamierzam opu�ci� Khorinis.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_01"); //M�dra decyzja. Ch�tnie zabra�bym si� z tob�. To miasto za bardzo si� zmieni�o. Ci�ko b�dzie tutaj szybko si� wzbogaci�.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_02"); //M�g�bym ci� podszkoli� w �ucznictwie, otwieraniu zamk�w i zr�czno�ci.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_03"); //No i przyda ci si� chyba dobry z�odziej?
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry (TOPIC_Crew,"Oczywi�cie, Diego chce mi towarzyszy�. Uwa�a, �e im szybciej opu�ci Khorinis, tym lepiej. M�g�by mi pokaza�, jak zwi�kszy� zr�czno��, i przeszkoli� mnie w pos�ugiwaniu si� �ukiem oraz otwieraniu zamk�w.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_DiegoNW_KnowWhereEnemy_15_04"); //Zastanowi� si� nad tym. W tej chwili mam ju� prawie ca�� za�og�.
		AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_05"); //Nie musisz si� spieszy�. Nigdzie si� nie wybieram.
	}
	else 
	{
		Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Szczeg�y poznasz, gdy nadejdzie odpowiednia pora.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Nie chcesz i�� ze mn�?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00"); //Pop�y� ze mn�. Mo�emy si� spotka� na przystani.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01"); //Hmmm... Masz racj�. Khorinis to rynsztok. P�yn� z tob�!
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02"); //Daj mi jedn� chwil�. Zaraz b�d� gotowy.
		AI_SetWalkmode 	(self, NPC_WALK);		
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_Wait (self ,1);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03"); //Mog� ju� rusza�. Do zobaczenia na statku!
	
	
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
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_No_15_00"); //Mo�e dam ci zna�, gdy nadejdzie odpowiednia chwila.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01"); //Tak zr�b. Kto wie? Mo�e nawet z tob� pop�yn�?

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
	description	 = 	"Mo�esz ju� wraca� do miasta.";
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
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_00"); //Mo�esz ju� wraca� do miasta.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_01"); //Serio? Nie potrzebujesz mnie? Jak chcesz. Jak wr�cisz do miasta, zajrzyj do mnie koniecznie.
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_02"); //My�lisz, �e si� jeszcze kiedy� spotkamy?
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_03"); //Nigdy nie zapomn� wyrazu twojej twarzy podczas naszego pierwszego spotkania, gdy Bullit powali� ci� na ziemi�.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_04"); //Takich jak ty nie mo�na pokona�. Jeszcze si� spotkamy. Bywaj!
	
	
	Diego_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_StillNeedYou_Condition;
	information	 = 	DIA_DiegoNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Chod� ze mn�. Chc�, �eby� mi towarzyszy�.";
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
	AI_Output	(other, self, "DIA_DiegoNW_StillNeedYou_15_00"); //Chod� ze mn�. Chc�, �eby� mi towarzyszy�.
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_01"); //Gdzie si� podzia�a twoja pewno�� siebie, przyjacielu? Jasne, p�jd� z tob�. Tylko si� wreszcie zdecyduj!
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_StillNeedYou_11_02"); //Czekaj, za chwil� b�d� gotowy.
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_03"); //Dobra, mo�emy i��.
	
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


