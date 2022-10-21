
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Canthar_PICKPOCKET (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 900;
	condition	= DIA_Canthar_PICKPOCKET_Condition;
	information	= DIA_Canthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Canthar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 25);
};
 
FUNC VOID DIA_Canthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Canthar_PICKPOCKET);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_BACK 		,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};
	
func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Canthar_EXIT(C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 999;
	condition	= DIA_Canthar_EXIT_Condition;
	information	= DIA_Canthar_EXIT_Info;
	permanent	= TRUE;
	description = "Ich muß weiter!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //Ich muss weiter!
	AI_Output (self, other,"DIA_Canthar_EXIT_09_01"); //Von mir aus.
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  			Personal CRIMES
// ************************************************************

INSTANCE DIA_Canthar_PersonalCRIMES (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_PersonalCRIMES_Condition;
	information	= DIA_Canthar_PersonalCRIMES_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

func INT DIA_Canthar_PersonalCRIMES_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Canthar_PersonalCRIMES_Info()
{	
	// ------ Spieler hat mich besiegt ------
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //Es war sehr dumm von dir, mich anzugreifen!
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(spöttisch) Hast du gedacht, du könntest mich so leicht besiegen?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //Entweder du machst die Sache wieder gut, oder ich werde dafür sorgen, dass du deine Tat bitter bereust!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //Und was schwebt dir da vor?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "So viel habe ich nicht!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Hier hast du dein Gold - vergessen wir die Sache!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Hier hast du dein Gold - vergessen wir die Sache!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //Sehr vernünftig von dir!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //So viel habe ich nicht!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //Was stiehlst du dann meine Zeit!
	
	AI_StopProcessInfos(self);
};


// ************************************************************
// 			  				 Hallo 
// ************************************************************

INSTANCE DIA_Canthar_Hallo (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_Hallo_Condition;
	information	= DIA_Canthar_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Canthar_Hallo_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_Hallo_Info()
{	
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	// ------ OHNE Rüstung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //Sieh an, wen haben wir denn da?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Du bist auf dem Weg in die Stadt - hab ich nicht Recht?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Kann schon sein.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Hm! (schnaubt) Du siehst aus wie ein Flüchtling! Alle Flüchtlinge wollen in die Stadt.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Du könntest sogar ein ehemaliger Sträfling aus der Minenkolonie sein.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(hastig) Mir ist egal, wo du herkommst. Aber ich glaube, ich habe ein interessantes Angebot für dich ...
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//Wie läuft die Arbeit, Bauersmann?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "Seh ich wie ein Bauer aus?!" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "Ich kann nicht klagen."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen Rüstungen (höchst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //Was kann ich für dich tun?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//Ich kann nicht klagen.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//Kann ich etwas für dich tun?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //Seh ich wie ein Bauer aus?!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //Ganz genau wie ein Bauer. Aber du redest nicht wie einer!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //(überlegt) Wenn mich nicht alles täuscht, habe ich ein interessantes Angebot für dich ...
	
	Canthar_GotMe = TRUE;
	
	Info_ClearChoices	(DIA_Canthar_Hallo);
};


// ************************************************************
// 		  				 	WhatOffer				//E3
// ************************************************************

INSTANCE DIA_Canthar_WhatOffer (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_WhatOffer_Condition;
	information	= DIA_Canthar_WhatOffer_Info;
	permanent	= FALSE;
	description	= "Was hast du anzubieten?";
};                       

FUNC INT DIA_Canthar_WhatOffer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_WhatOffer_Info()
{	
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //Was hast du anzubieten?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //So wie du aussiehst, lassen dich die Wachen nie in die Stadt.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(ironisch) Wenn du bei den Torwachen genauso 'überzeugend' bist wie bei mir, lassen die dich nie in die Stadt.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //Ich kann dir helfen, in die Stadt zu kommen.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //Ich habe hier ein kleines Stückchen Papier. Mit königlichem Siegel und der Unterschrift des Statthalters. Ein Passierschein.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //Mit dem Wisch in der Tasche kannst du so abgerissen rumlaufen, wie du willst, und die Wachen lassen dich in Ruhe.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //Interesse?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Nein! Deinen Schein kannst du behalten!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Was willst du für deinen Passierschein?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Wie kommst DU in die Stadt?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Da ist doch ein Haken an der Sache..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Ich bin fahrender Händler. Ich verkaufe von allem etwas.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar handelt mit aller Art von Waren."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //Da ist doch ein Haken an der Sache ...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //(übertrieben) Nein. Kein Haken. Du schuldest mir lediglich einen Gefallen.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //Wie kommst DU in die Stadt?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Die Wachen kennen mich. Ich werde ihnen einfach erzählen, ich hätte den Passierschein verloren.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //Was willst du für deinen Passierschein?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(freut sich) Ich WUSSTE du bist der richtige Mann!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Hör zu. Du bekommst den Schein von mir - jetzt.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //Einfach so?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Einfach so. ABER: Wenn ich dich in der Stadt treffe, schuldest du mir einen Gefallen.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //Haben wir eine Abmachung?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Klar - immer her mit dem Wisch.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Klar - immer her mit dem Wisch.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Hier. Sei vorsichtig damit, er ist sehr wertvoll.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Eins noch: Denk nicht einmal darüber nach, dein Wort zu brechen!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Als Händler habe ich einen sehr großen Einfluss in der Stadt - es würde dir nicht bekommen, glaub mir!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Ich habe einen Passierschein vom Händler Canthar, der mir Zugang zur Stadt ermöglicht. Dafür schulde ich ihm einen Gefallen, wenn ich ihn in der Stadt treffe.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //Nein! Deinen Schein kannst du behalten!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Hm. Da hab ich dich wohl falsch eingeschätzt, was?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //Na ja. Willst du was anderes? Kann ich dich für meine Waren interessieren?
	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
};


// ************************************************************
// 		  				 	TRADE				
// ************************************************************

instance DIA_Canthar_TRADE		(C_INFO)
{
	npc		 	= Vlk_468_Canthar;
	nr 			= 888;
	condition	= DIA_Canthar_TRADE_Condition;
	information	= DIA_Canthar_TRADE_Info;
	permanent	= TRUE;
	description	= "Zeig mir deine Ware!";
	trade		= TRUE;
};

func int DIA_Canthar_TRADE_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //Zeig mir deine Ware!
	
	B_GiveTradeInv (self);
	
	AI_Output (self, other, "DIA_Canthar_TRADE_09_01"); //Such dir was aus.
	
	
};



// ###########################################
// ###########################################

// 				In der Stadt 

// ###########################################
// ###########################################
/*
		-->
		Aber ein Händler namnes Canthar hat das erzählt. 
	*/

///////////////////////////////////////////////////////////////////////
//	Info PayPriceInCity
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_PAYPRICEINCITY		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_PAYPRICEINCITY_Condition;
	information	 = 	DIA_Canthar_PAYPRICEINCITY_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};

func int DIA_Canthar_PAYPRICEINCITY_Condition ()
{
	if (Canthar_InStadt == TRUE)
	&& (Npc_IsDead(Sarah) == FALSE) 
	&& (Canthar_GotMe == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_PAYPRICEINCITY_Info ()
{
	if (Canthar_Gefallen == TRUE)
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //Du schuldest mir noch einen Gefallen. Es ist Zeit, diese Schuld zu begleichen.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Hey du, ich hab ein Angebot für dich.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //Was willst du?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Ich will meinen alten Stand am Marktplatz zurück. Den hat sich Sarah unter den Nagel gerissen.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //Aber sie hat lange genug dort gestanden. Ich will, dass sie den Stand aufgibt.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //Und welche Rolle spiele ich dabei?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //Ich gebe dir einen Brief, den schiebst du ihr in die Tasche.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Dann gehst zu Andre und erzählst ihm, dass Sarah Waffen an Onar verkauft.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Sie landet im Gefängnis, du kassierst das Kopfgeld und ich kriege den Stand.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //Du hast zwei Tage Zeit, das zu erledigen.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //Was würde für mich dabei rausspringen?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Wenn ich den Stand habe, bekommst du eine Waffe von mir - und zwar eine verdammt gute.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Nein, darauf lasse ich mich nicht ein. ", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Okay, ich mach's.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Was passiert, wenn ich das nicht mache?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //Was passiert, wenn ich das nicht mache?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //Das wäre wirklich dumm von dir, denn siehst du, ich weiß, dass du ein entflohener Sträfling bist.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Wenn sich das rumspricht, könnte das deiner Situation in der Stadt erheblich schaden ...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //Nein, darauf lasse ich mich nicht ein.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //Das war die falsche Entscheidung, Junge. Wir sprechen uns wieder.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //Ok, ich habe offensichtlich keine andere Wahl.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Du bist ein schlauer Bursche. Hier ist der Brief.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //Wie soll ich ihr den Brief unterschieben?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Lass dir einfach ihre Ware zeigen - und dabei steckst du ihr den Brief zu.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //Und denk daran, ich bin ein einflussreicher Mann in der Stadt, also versuche nicht, mich zu verarschen.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar will, das ich den Gefallen einlöse, den ich ihm noch schulde.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar hat mir eine Waffe versprochen, dafür das ich ihm einen Gefallen erweise.");
	};
	B_LogEntry (TOPIC_Canthar,"Ich soll der Händlerin Sarah einen Brief unterschieben, der sie belastet, an Onar Waffen zu liefern. Dann soll ich sie bei Lord Andre verpfeifen.");
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};
///////////////////////////////////////////////////////////////////////
//	Info SarahErledigt
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_SARAHERLEDIGT		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_SARAHERLEDIGT_Condition;
	information	 = 	DIA_Canthar_SARAHERLEDIGT_Info;
	permanent	 =	TRUE;
	description	 = 	"Wegen Sarah...";
};
func int DIA_Canthar_SARAHERLEDIGT_Condition ()
{
	if 	(MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Canthar_SARAHERLEDIGT_Info ()
{
	if ((Npc_IsDead(Sarah)) == FALSE)
	{
		if (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay()+ 2))
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //Hast du nicht einen Job zu erledigen?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Schieb Sarah erst den Brief unter, dann verpfeifst du sie bei Andre.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Mach das - und versuche nicht, mich reinzulegen, das würdest du bereuen.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Du lässt dir ganz schön viel Zeit. Jetzt mach mal hin.
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sarah ist tot.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //Wirklich? Schön. Dann hat sich das mit unserer kleinen Abmachung erledigt.
			
			MIS_Canthars_KomproBrief = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
			Npc_ExchangeRoutine	(self,"MARKTSTAND"); 
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Success		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Success_Condition;
	information	 = 	DIA_Canthar_Success_Info;
	permanent	 =  FALSE;
	description	 = "Wegen Sarah...";
};
func int DIA_Canthar_Success_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)
	&& ((Npc_IsDead(Sarah)) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Success_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Gut gemacht. Sarah ist dort, wo sie hingehört.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //Ich habe ihre Waren übernommen, wenn du also eine Waffe brauchst, komm zu mir.
	
	if (Kapitel == 1)
	{
		CreateInvItems (self,ItMw_ShortSword3 , 1); 
		CreateInvItems (self,ItMw_ShortSword4 , 1);
		CreateInvItems (self,ItMw_ShortSword5 , 1);
		CreateInvItems (self,ItMw_Kriegshammer1, 1); 
		
		CreateInvItems (self, ItMw_1h_Vlk_Sword, 1); 
		CreateInvItems (self, ItMw_1h_Nov_Mace, 1); 
	};
	if (Kapitel == 2)
	{
		CreateInvItems (self,ItMw_Stabkeule , 1);
		CreateInvItems (self,ItMw_Steinbrecher, 1); 
		CreateInvItems (self,ItMw_Schwert2 , 1); 
		CreateInvItems (self,ItMw_Bartaxt , 1); 
	};
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //Du wolltest mir eine Waffe geben.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //Richtig. Hier, diese Waffe ist ein Meisterwerk der Schmiedekunst.
				
		B_GiveInvItems (self, other, ItMW_Schiffsaxt,1);
	};
	B_GivePlayerXP (XP_Canthars_KomproBrief);
};

//---------------------------------------------------------------------

				//Canthat hat seinen Marktstand OHNE Spieler Hilfe 

//---------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info Canthar hat den Stand 
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Again		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Again_Condition;
	information	 = 	DIA_Canthar_Again_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Canthar_Again_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Again_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Again_09_00"); //Sieh an, da bist du ja wieder.
	
	if (MIS_Canthars_KomproBrief  == LOG_FAILED)
	{
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //Warum sitzt du nicht im Knast?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Ich bin freigelassen worden. Wie ich es dir schon sagte - ich bin ein einflussreicher Mann in der Stadt.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //Ich habe mich inzwischen selbst um Sarah gekümmert. Die Sache mit dem Brief kannst du vergessen.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //Hatte ich dich nicht gewarnt? Du hättest mal besser getan, was ich dir gesagt habe.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //Jetzt hat sich bei den Händlern herumgesprochen, dass du ein Sträfling bist.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Eine dumme Sache - du wirst hier am Marktplatz nicht mal mehr ein Brot kriegen.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Ich könnte das allerdings wieder hinbiegen, für, sagen wir ...
	B_Say_Gold 	(self, other, Canthar_Gold);
	
	AI_StopProcessInfos (self);
	
};

///////////////////////////////////////////////////////////////////////
//	Info Canthar bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Pay		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_Pay_Condition;
	information	 = 	DIA_Canthar_Pay_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};

func int DIA_Canthar_Pay_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Canthar_Again)
	&& (Canthar_Sperre == TRUE)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Pay_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //Bist du gekommen, um zu bezahlen?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"Na schön, ich bezahle...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"Ich habe nicht genug Gold dabei...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"Wieviel war es nochmal?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //Na schön, ich bezahle, du lässt mir ja keine Wahl.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(grinst) Gut. Dann werde ich mal dafür sorgen, dass du wieder im Ansehen der Händler steigst.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //Ich habe nicht genug Gold dabei ...
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Dann besorge es dir.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //Wie viel war es noch mal?
	B_Say_Gold 	(self, other, Canthar_Gold);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Canthar im Knast
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_CANTHARANGEPISST		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_CANTHARANGEPISST_Condition;
	information	 = 	DIA_Canthar_CANTHARANGEPISST_Info;
	important	 = 	TRUE;
	permanent	 =  TRUE;
};
func int DIA_Canthar_CANTHARANGEPISST_Condition ()
{
	if (Canthar_Ausgeliefert == TRUE)  //SC hat Canthar bei Andre verpfiffen!
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	&& Npc_IsInState  (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_CANTHARANGEPISST_Info ()
{
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Ich habe dich gewarnt, aber du wolltest nicht hören. Wir sprechen uns noch.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //Jetzt verpiss dich, ich will mich ausruhen.
	
	AI_StopProcessInfos (self);	
};
///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_MinenAnteil		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 = 	3;
	condition	 = 	DIA_Canthar_MinenAnteil_Condition;
	information	 = 	DIA_Canthar_MinenAnteil_Info;

	description	 = 	"Du verkaufst illegale Minenanteile!";
};

func int DIA_Canthar_MinenAnteil_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
		{
				return TRUE;
		};
};

func void DIA_Canthar_MinenAnteil_Info ()
{
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //Du verkaufst illegale Minenanteile!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //Ja und? Was soll's! Mache ich es nicht, macht's ein anderer.
	B_GivePlayerXP (XP_Ambient);
};











