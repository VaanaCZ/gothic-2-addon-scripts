
//***********************************************************************
//	Info EXIT 
//***********************************************************************

INSTANCE DIA_Agon_EXIT   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 999;
	condition   = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//************************************************************************
//			Hello
//************************************************************************

INSTANCE DIA_Agon_Hello   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 2;
	condition   = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Agon_Hello_Condition()
{
	if  (Npc_IsInState (self,ZS_Talk))
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_Hello_Info()
{
	AI_Output (self ,other,"DIA_Agon_Hello_07_00"); //(geringschätzend) Was willst Du?
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Agon_Wurst(C_INFO)
{
	npc         = NOV_603_Agon;
	nr			= 2;
	condition	= DIA_Agon_Wurst_Condition;
	information	= DIA_Agon_Wurst_Info;
	permanent	= FALSE;
	description = "Ich hab hier 'ne Schafswurst für dich.";
};                       

FUNC INT DIA_Agon_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Agon_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Agon_Wurst_15_00"); //Ich hab hier 'ne Schafswurst für dich.
	AI_Output (self, other, "DIA_Agon_Wurst_07_01"); //Schafswurst, Schafskäse ... Schafsmilch ... so langsam kann ich es nicht mehr sehen.
	AI_Output (other, self, "DIA_Agon_Wurst_15_02"); //Willst du jetzt die Wurst, oder nicht?
	AI_Output (self, other, "DIA_Agon_Wurst_07_03"); //Ach, gib schon her!
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//***********************************************************************
//	Ich bin Neu hier.
//***********************************************************************

INSTANCE DIA_Agon_New   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent   = FALSE;
	description = "Ich bin neu hier";
};

FUNC INT DIA_Agon_New_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_New_Info()
{
	AI_Output	(other,self ,"DIA_Agon_New_15_00"); //Ich bin neu hier.
	AI_Output	(self ,other,"DIA_Agon_New_07_01"); //Das sehe ich.
	AI_Output	(self ,other,"DIA_Agon_New_07_02"); //Wenn du noch keine Arbeit hast, dann wende dich an Parlan. Er wird dir eine zuteilen.
};
//***********************************************************************
//	Was ist zwischen dir und Babo passiert?
//***********************************************************************

INSTANCE DIA_Agon_YouAndBabo   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent   = FALSE;
	description = "Was ist zwischen dir und Babo passiert?";
};

FUNC INT DIA_Agon_YouAndBabo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Opolos_Monastery)
	&& (MIS_SCHNITZELJAGD == FALSE))
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_YouAndBabo_Info()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_15_00"); //Was ist zwischen dir und Babo passiert?
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_01"); //Du solltest nicht alles glauben, was man dir erzählt.
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_02"); //(eindringlich) Nur damit wir uns verstehen: Ich werde meinen Weg gehen. Den Weg, den Innos mir vorherbestimmt hat.
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_03"); //Ich werde nicht zulassen, dass mich irgendwer daran hindert, schon gar nicht dieser einfältige Babo.

	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Sollten wir Novizen nicht zusammenhalten?",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Nur Innos weiß, welchen Weg wir gehen werden.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Wir werden uns gut verstehen.",DIA_Agon_YouAndBabo_Understand);
};

FUNC VOID DIA_Agon_YouAndBabo_AllTogether ()
{
	AI_Output (other,self ,"DIA_Agon_YouAndBabo_AllTogether_15_00"); //Sollten wir Novizen nicht zusammenhalten?
	AI_Output (self ,other,"DIA_Agon_YouAndBabo_AllTogether_07_01"); //Ihr könnt von mir aus zusammenhalten, soviel ihr wollt.
	AI_Output (self ,other,"DIA_Agon_YouAndBabo_AllTogether_07_02"); //Aber bitte, stehlt mir nicht meine Zeit. (kalt) Und es sollte sich mir niemand in den Weg stellen.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};

FUNC VOID DIA_Agon_YouAndBabo_InnosWay ()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_InnosWay_15_00"); //Nur Innos weiß, welchen Weg wir gehen werden.
	AI_Output 	(self ,other,"DIA_Agon_YouAndBabo_InnosWay_07_01"); //Meine Familie stand schon immer hoch in der Gunst Innos' und daran wird sich auch nichts ändern.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};
FUNC VOID DIA_Agon_YouAndBabo_Understand ()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_Understand_15_00"); //Wir werden uns gut verstehen.
	AI_Output 	(self ,other,"DIA_Agon_YouAndBabo_Understand_07_01"); //Das hoffe ich. Wenn ich erstmal Magier bin, kann ich ein gutes Wort für dich einlegen.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};
//************************************************************************
//	Kann ich bei dir Kräuter bekommen?
//************************************************************************

INSTANCE DIA_Agon_GetHerb   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent   = TRUE;
	description = "Was wird hier gepflanzt?";
};

FUNC INT DIA_Agon_GetHerb_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Agon_GetHerb_Info()
{
	AI_Output (other,self ,"DIA_Agon_GetHerb_15_00"); //Was wird hier gepflanzt?
	AI_Output (self ,other,"DIA_Agon_GetHerb_07_01"); //Wir versuchen Heilpflanzen zu züchten, damit Meister Neoras daraus Tränke brauen kann.
};
//************************************************************************
//	Agon ist in der Höhle
//************************************************************************

INSTANCE DIA_Agon_GolemDead   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Agon_GolemDead_Condition()
{
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead (Magic_Golem))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_GolemDead_Info()
{
	AI_Output (self ,other,"DIA_Agon_GolemDead_07_00"); //(triumphierend) Du kommst zu spät!
	AI_Output (self ,other,"DIA_Agon_GolemDead_07_01"); //Ich war zuerst hier! Ich habe gewonnen!
	 
	Info_ClearChoices (DIA_Agon_GolemDead);
	Info_AddChoice (DIA_Agon_GolemDead,"(drohend)Nur wenn Du hier lebend rauskommst!",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice (DIA_Agon_GolemDead,"Halt die Klappe!",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice (DIA_Agon_GolemDead,"Gratuliere, du hast es wirklich verdient.",DIA_Agon_GolemDead_Congrat);
};

FUNC VOID DIA_Agon_GolemDead_NoWay ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_NoWay_15_00"); //(drohend) Nur, wenn du hier lebend rauskommst.
	AI_Output (self ,other,"DIA_Agon_GolemDead_NoWay_07_01"); //Willst du mich töten? Das wird dir nicht gelingen.

	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_ShutUp ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_15_00"); //Halt die Klappe!
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_07_01"); //(höhnisch) Es ist aussichtslos, du hast verloren! Finde dich damit ab.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_07_02"); //Nur mir ist es bestimmt, Magier zu werden.
	
	Info_ClearChoices (DIA_Agon_GolemDead);
	Info_AddChoice (DIA_Agon_GolemDead,"Dir ist gar nichts bestimmt. Die Truhe gehört mir.",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice (DIA_Agon_GolemDead,"Du hast gewonnen.",DIA_Agon_GolemDead_ShutUp_YouWin);

};

FUNC VOID DIA_Agon_GolemDead_ShutUp_MyChest ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00"); //Dir ist gar nichts bestimmt. Die Truhe gehört mir.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01"); //(aufgebracht) Nein, das kannst du nicht tun, eher werde ich dich töten.
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_ShutUp_YouWin ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00"); //Du hast gewonnen.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01"); //(aufgebracht) Nein, du täuschst mich nicht. Du willst mich aus dem Weg räumen.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02"); //Das werde ich verhindern!
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_Congrat ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_Congrat_15_00"); //Gratuliere, du hast es wirklich verdient.
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_01"); //(misstrauisch) Was soll das? Was hast du vor?
	AI_Output (other,self ,"DIA_Agon_GolemDead_Congrat_15_02"); //Wovon redest du?
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_03"); //(aufgeregt) Du willst mir den Sieg streitig machen. Du willst mich töten und den ganzen Ruhm für dich haben!
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_04"); //Das wird dir nicht gelingen!
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

//****************************************
//	Der Sc war vor Agon in der Höhle
//****************************************

INSTANCE DIA_Agon_GolemLives   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Agon_GolemLives_Condition()
{
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead (Magic_Golem)== FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_GolemLives_Info()
{
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_00"); //(Überrascht) Du hast das Versteck vor mir gefunden. Das kann nicht sein ...
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_01"); //(entschlossen) Das darf nicht sein! Das werde ich nicht zulassen.
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_02"); //Man wird noch nicht mal deine Leiche finden.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0);
};

//****************************************
//	Sc hat Agon am Leben gelassen
//****************************************
/*
INSTANCE DIA_Agon_StillAlive   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_StillAlive_Condition;
	information = DIA_Agon_StillAlive_Info;
	permanent   = TRUE;
	description = "Was machst Du hier?";
};

FUNC INT DIA_Agon_StillAlive_Condition()
{
	if ((Kapitel >= 2)
	&& 	(hero.guild == GIL_KDF))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_StillAlive_Info()
{
	AI_Output (other,self ,"DIA_Agon_StillAlive_15_00"); //Was machst Du hier? 
	AI_Output (self ,other,"DIA_Agon_StillAlive_07_01"); //Hättest Du mich nicht töten können? Dann müsste ich das ganze hier wenigstens nicht mehr ertragen. 
	AI_Output (self ,other,"DIA_Agon_StillAlive_07_02"); //Jetzt lass mich in Ruhe! Geh zurück ins Kloster!
	
	AI_StopProcessInfos (self);
};
*/
//***********************************************************************
// Perm
//***********************************************************************

INSTANCE DIA_Agon_Perm   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 2;
	condition   = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent   = TRUE;
	description = "Wie geht's denn so?";
};

FUNC INT DIA_Agon_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Agon_Perm_Info()
{
	AI_Output	(other,self ,"DIA_Agon_Perm_15_00"); //Wie geht's denn so?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output	(self ,other,"DIA_Agon_Perm_07_01"); //Oh - danke der Nachfrage, Herr Paladin. Die Arbeit hier macht mich glücklich und ich werde bestimmt bald zum Magier erwählt.
	}
	else
	{
		AI_Output	(self ,other,"DIA_Agon_Perm_07_02"); //(arrogant) Du bist nur Gast hier im Kloster Innos'. Also solltest du dich entsprechend benehmen und mich nicht bei der Arbeit stören. Guten Tag.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Agon_PICKPOCKET (C_INFO)
{
	npc			= NOV_603_Agon;
	nr			= 900;
	condition	= DIA_Agon_PICKPOCKET_Condition;
	information	= DIA_Agon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Agon_PICKPOCKET_Condition()
{
	C_Beklauen (23, 12);
};
 
FUNC VOID DIA_Agon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Agon_PICKPOCKET);
	Info_AddChoice		(DIA_Agon_PICKPOCKET, DIALOG_BACK 		,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Agon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Agon_PICKPOCKET);
};
	
func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Agon_PICKPOCKET);
};


