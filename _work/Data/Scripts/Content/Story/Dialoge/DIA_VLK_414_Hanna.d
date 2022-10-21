// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Ah, Kundschaft, was kann ich für Dich tun?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Ich suche ein Zimmer.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Ich suche ein Zimmer.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //Da bist du hier richtig.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Einer der Paladine hat mir gesagt, ich könnte hier umsonst übernachten,,,
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Was kostet eine Übernachtung?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Gar nichts.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Die Paladine kommen für sie Unterbringung aller Reisenden auf.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //Also kann ich hier umsonst übernachten?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Ja, ja.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Geh einfach die Treppe hoch.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Wir haben noch ein oder zwei Betten frei.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Warum bezahlen die Paladine das alles?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Warum bezahlen die Paladine das alles?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Ich weiß auch nicht, was das alles soll.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Ich denke, zum einen wollen sie die armem Schlucker von der Strasse holen, damit sie keine Dummheiten machen.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //Und zum anderen wollen sie sich mit den fahrenden Händlern gutstellen.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Jetzt, wo die Bauern sich auflehnen, sind wir auf die Versorgung durch die Händler angewiesen.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //Außerdem, denke ich, wollen sie die Stimmung in der Stadt ein bißchen anheben.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre hat ja auch angeordnet, daß am Galgenplatz Freibier ausgeschenkt wird.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Wer übernachtet hier zur Zeit?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Wer übernachtet hier zur Zeit?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Es sind fast alles fahrende Händler vom Markt.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Denk nicht mal dran, dich an ihren Sachen zu vergreifen! Ich will hier keinen Ärger haben!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "Ich hab ein paar Fragen zur Stadt ...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Ich hab ein paar Fragen zur Stadt ...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Wo kann ich hier was kaufen",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Erzähl mir was über die Stadt",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Wo kann ich hier was kaufen?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Der Markt ist direkt vor der Tür. Dort solltest du eigentlich alles bekommen.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Auf der anderen Seite der Stadt gibt es noch ein paar Läden und Handwerker, die meisten sind in der Nähe vom anderen Stadttor.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //Ansonsten gibt es im Hafenviertel noch einen Fischhändler. Er hat seinen Laden direkt am Hafen. Du wirst ihn schon finden.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Erzähl mir was über die Stadt.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Auch wenn es im Moment nicht so aussieht, ist Khorinis eine der reichsten Städte des Königreichs.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Doch seit dem Krieg mit den Orks ist der Handel fast komplett zum Erliegen gekommen. Der König hat die gesamte Handelsflotte in den Kriegsdienst beordert,
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //so dass zurzeit kaum noch ein Schiff im Hafen anlegt. Das Angebot an Waren ist daher zurzeit sehr knapp und viele Bürger der Stadt sind sehr besorgt.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Keiner weiß so recht, was die Zukunft bringt. Wir können eigentlich nichts anderes machen als abzuwarten, was passiert. Ändern können wir sowieso nichts.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Wie sieht's aus?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //Wie sieht's aus?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Du siehst nicht so aus, als ob dir die Sorgen anderer irgendwas bedeuten.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Doch natürlich.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"Kommt drauf an.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Eigentlich nicht.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Eigentlich nicht.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //Sag ich doch. Hier denkt jeder immer nur an sich, also was willst du?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //Das kommt drauf an.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //Kommt drauf an, wie viel da zu holen ist, wolltest du wohl sagen.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Solche Kerle kann ich hier nicht gebrauchen.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Doch natürlich.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Ja, Überraschungen gibt es immer wieder. Ich habe in der Tat ein Problem. Ich habe vor kurzem ausgemistet und einen Packen alter Karten an Brahim, den Kartenzeichner unten im Hafen, verkauft
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Leider habe ich festgestellt, dass mir ein Schriftstück abhanden gekommen ist.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Ich vermute, dass es versehentlich zwischen die Papiere geraten ist.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Könntest du es mir wiederbeschaffen.?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hanna vermisst ein Schriftstück. Es soll am Hafen beim Kartenzeichner Brahim abhanden gekommen sein."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Ich bin doch kein Laufbursche.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"Was kriege ich dafür?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Ich werde mal sehen, was ich tun kann.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Ich bin doch kein Laufbursche.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Die Probleme einer einfachen Frau sind dir wohl zu profan. Dann werde ich mich wohl selber darum kümmern müssen.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //Was kriege ich dafür?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Also doch, wusste ich es doch, du bist auch nicht besser als das Gesindel im Hafen.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Was verlangst du denn von einer armen Frau?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Schon gut.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Du könntest ein bisschen Nett zu mir sein.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Gold.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Schon gut.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Wenigstens hast du doch noch ein Funken Anstand. Wenn du mir das Schriftstück wiederbesorgst, bekommst du 75 Goldstücke von mir.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Du könntest ein bisschen nett zu mir sein.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //Das ist ja ungeheuerlich. Ich ... scher dich raus! Du Flegel!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Gold.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Schnödes Gold, damit kann ich nicht dienen. Okay, 50 Goldstücke ist es mir wert.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Wenn du es schaffst, das Schriftstück wieder zu besorgen, bekommt du 50 Goldstücke von mir.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Ich werde mal sehen, was ich tun kann.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //Du bist ein Schatz, ich wünsche dir viel Glück!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Wenn du mir das Stück zurückbringst, bekommst du auch eine Belohnung.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Meinst du dieses Schriftstück?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Meinst du dieses Schriftstück?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Ja, genau das habe ich gesucht. Danke.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //Was ist meine Belohnung?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Nicht so hastig. Hier hast du dein Gold.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Wo... kommst du denn her?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //Ich habe in deinem Keller was interessantes gefunden...
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //Was hattest du in meinem Keller zu suchen?!
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //Das weißt du verdammt genau!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(abweisend) Ich weiß nicht, wovon du redest...
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(mißtrauisch) Sieh an! Wo kommst du denn her? hm?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //Ich...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(lacht) Ich weiß!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(verschwörerisch) Du brauchst mir nichts zu sagen. Ich weiß alles.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Lass dir bloß nicht einfallen, hier was zu klauen, klar?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //Wir können es uns nicht leisten, Aufmerksamkeit auf das Hotel zu ziehen.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Schau mal, was ich hier für ein Buch habe!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Schau mal, was ich hier für ein Buch habe!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //Lehmars Schuldenbuch. Wie bist du daran gekommen?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //Tja...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //Wenn Lehmar es nicht mehr hat, ist das gut - Aber lieber hätte ich es selbst...
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Hier - nimm das Buch.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Hier - nimm das Buch.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Danke.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Nimm das hier als Belohnung...
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //Was hast du mir da gegeben?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //Es ist ein Schlüssel.zur Pforte des Reichtums.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Alles klar im Versteck?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //Ich habe schon länger keinen von ihnen mehr gesehen.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Ich sollte mal bei Gelegenheit runtergehen und nach dem Rechten sehen.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Ja. Aber du solltest besser nicht darüber reden...
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Wußtest du vom Versteck der Diebe?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(schmunzelt) Ich weiß nicht, wovon du redest...
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //Die Miliz war hier... Jemand hat das Versteck verraten!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Mir konnten sie nichts nachweisen, aber Cassia und ihre Leute sind tot!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Ich bin mir sicher, DU warst es...
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Das hier hab ich mir extra für dich gekauft.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Hat mich ne Menge Gold gekostet. Aber du Schwein warst es mit wert...
};	

	
