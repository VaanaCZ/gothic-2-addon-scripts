//***********************************************************************
//	Info EXIT 
//***********************************************************************
INSTANCE DIA_Babo_Kap1_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//***********************************************************************
//	Info Hello 
//***********************************************************************
INSTANCE DIA_Babo_Hello   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Babo_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (other.guild == GIL_NOV)
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Hello_Info()
{
	
	
	AI_Output (self ,other,"DIA_Babo_Hello_03_00"); //(schüchtern) Hallo, du bist auch neu hier oder?
	AI_Output (other,self ,"DIA_Babo_Hello_15_01"); //Ja, seit wann bist du denn da?
	AI_Output (self ,other,"DIA_Babo_Hello_03_02"); //Ich bin seit vier Wochen hier. Hast du schon einen Kampfstab bekommen?
	AI_Output (other,self ,"DIA_Babo_Hello_15_03"); //Bisher noch nicht.
	AI_Output (self ,other,"DIA_Babo_Hello_03_04"); //Dann nimm diesen hier. Wir Novizen tragen alle einen Stab, als Zeichen unserer Wehrhaftigkeit. Kannst du kämpfen?
	AI_Output (other,self ,"DIA_Babo_Hello_15_05"); //Nun ja, ich hab schon mal eine Waffe geschwungen ...
	AI_Output (self ,other,"DIA_Babo_Hello_03_06"); //Wenn du willst, kann ich dir was beibringen. Allerdings hätte ich da ein Anliegen ...

	B_GiveInvItems (self,other,ITMW_1h_NOV_Mace,1);
	AI_EquipBestMeleeWeapon (self);
	
};
//***********************************************************************
//	Info Anliegen
//***********************************************************************
INSTANCE DIA_Babo_Anliegen   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent   = FALSE;
	description	= "Was hast du für ein Anliegen?";
};
FUNC INT DIA_Babo_Anliegen_Condition()
{
	if  (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other, DIA_Babo_Hello))
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Anliegen_Info()
{
	AI_Output (other,self ,"DIA_Babo_Anliegen_15_00"); //Was hast du für ein Anliegen?
	AI_Output (self ,other,"DIA_Babo_Anliegen_03_01"); //Nun, einer der Paladine, Sergio, ist zurzeit im Kloster.
	AI_Output (self ,other,"DIA_Babo_Anliegen_03_02"); //Wenn du ihn überreden kannst, mit mir einige Übungen durchzuführen, dann trainiere ich dich.
	AI_Output (other,self ,"DIA_Babo_Anliegen_15_03"); //Ich werde mal sehen, was sich machen lässt.
	
	Log_CreateTopic (Topic_BaboTrain,LOG_MISSION);
	Log_SetTopicStatus (Topic_BaboTrain,LOG_RUNNING);
	B_LogEntry (Topic_BaboTrain,"Wenn ich den Paladin Sergio überrede, mit Babo ein paar Kampfübungen durchzuführen, trainiert er mich im zweihändigen Kampf.");
	
};
//***********************************************************************
//	Info Sergio
//***********************************************************************
INSTANCE DIA_Babo_Sergio   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent   = FALSE;
	description	= "Ich habe mit Sergio gesprochen...";
};
FUNC INT DIA_Babo_Sergio_Condition()
{
	if Npc_KnowsInfo (other, DIA_Sergio_Babo)
	&& (other.guild == GIL_NOV)
	
	
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Sergio_Info()
{
	AI_Output (other,self ,"DIA_Babo_Sergio_15_00"); //Ich habe mit Sergio gesprochen. Er wird jeden Morgen ab 5 Uhr mit dir zwei Stunden lang trainieren.
	AI_Output (self ,other,"DIA_Babo_Sergio_03_01"); //Danke! Was für eine Ehre für mich!
	AI_Output (self ,other,"DIA_Babo_Sergio_03_02"); //Wenn du willst, zeige ich dir auch die Geheimnisse des Kampfes.
	
	Babo_TeachPlayer = TRUE;	
	Babo_Training = TRUE;
	B_GivePlayerXP ((XP_Ambient)*2);
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	B_LogEntry (Topic_KlosterTeacher,"Babo kann mich im zweihändigen Kampf trainieren.");
};
//***************************************************************************************
//			Ich will trainieren
//***************************************************************************************
INSTANCE DIA_Babo_Teach(C_INFO)
{
	npc			= NOV_612_Babo;
	nr			= 100;
	condition	= DIA_Babo_Teach_Condition;
	information	= DIA_Babo_Teach_Info;
	permanent	= TRUE;
	description = "Ich bin bereit für das Training.";
};                       
//----------------------------------
var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;
//----------------------------------
FUNC INT DIA_Babo_Teach_Condition()
{
	if ((Babo_TeachPlayer == TRUE)
	&& (DIA_Babo_Teach_permanent == FALSE))
	|| (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
 
// -------------------------------
var int  babo_merk2h;
// -------------------------------
FUNC VOID DIA_Babo_Teach_Info()
{	
	babo_merk2h = other.HitChance [NPC_TALENT_2H]; 
	
	AI_Output (other,self ,"DIA_Babo_Teach_15_00"); //Ich bin bereit für das Training.
	
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);

};
FUNC VOID DIA_Babo_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output (self,other,"DIA_DIA_Babo_Teach_Back_03_00"); //Du hast alles über den zweihändigen Kampf gelernt, was ich dir beibringen konnte.
		
		DIA_Babo_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Babo_Teach);
};

FUNC VOID DIA_Babo_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 75);
	
	if (other.HitChance [NPC_TALENT_2H]  >  babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_00"); //Kämpfe für Innos. Innos ist unser Leben - und dein Glaube gibt dir Stärke.
		};
		if (Babo_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_01"); //Ein Diener Innos' provoziert keinen Gegner - er überrascht ihn!
		};
		if (Babo_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_02"); //Ganz egal, wo du auch hingehst - nimm immer deinen Stab mit.
		};
		if (Babo_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_03"); //Ein Diener Innos' ist immer bereit für den Kampf. Wenn du keine Zauber hast, ist dein Stab deine wichtigste Verteidigung.
		};
		
		Babo_Labercount = Babo_Labercount +1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;	
		};
	};
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);	
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);	
};

FUNC VOID DIA_Babo_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 75);
	
	if (other.HitChance [NPC_TALENT_2H]  >  babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_00"); //Ein Diener Innos' kämpft nicht nur mit dem Stab, sondern auch mit dem Herz.
		};
		if (Babo_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_01"); //Du musst den Punkt kennen, bis zu dem du zurückweichen darfst.
		};
		if (Babo_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_02"); //Bedenke, du kämpfst gut, wenn du den Gegner steuerst und ihm keine Möglichkeit gibst, sich selbst zu steuern.
		};
		if (Babo_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_03"); //Verloren hast du erst dann, wenn du aufgegeben hast.
		};
		
		Babo_Labercount = Babo_Labercount +1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;	
		};
	};
	
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);	
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Babo_Wurst(C_INFO)
{
	npc         = NOV_612_Babo;
	nr			= 2;
	condition	= DIA_Babo_Wurst_Condition;
	information	= DIA_Babo_Wurst_Info;
	permanent	= FALSE;
	description = "Hier, nimm eine Wurst.";
};                       

FUNC INT DIA_Babo_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Babo_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Babo_Wurst_15_00"); //Hier, nimm eine Wurst.
	AI_Output (self, other, "DIA_Babo_Wurst_03_01"); //Oh, Schafswürste, toll. Die schmecken am Besten - gib mir doch noch eine Wurst!
	AI_Output (other, self, "DIA_Babo_Wurst_15_02"); //Dann habe ich nicht mehr genug für die anderen.
	AI_Output (self, other, "DIA_Babo_Wurst_03_03"); //Eine Wurst hast du eh zuviel. Nämlich die, die für dich bestimmt ist. Und was ist schon eine Wurst unter Freunden?
	AI_Output (self, other, "DIA_Babo_Wurst_03_04"); //Komm, ich gebe dir auch eine 'Feuerpfeil'-Spruchrolle dafür.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Babo_Wurst);
	Info_AddChoice (DIA_Babo_Wurst,"Okay, hier nimm noch eine.",DIA_Babo_Wurst_JA);
	Info_AddChoice (DIA_Babo_Wurst,"Nein das mache ich nicht. ",DIA_Babo_Wurst_NEIN);
};
FUNC VOID DIA_Babo_Wurst_JA()
{
	AI_Output (other, self, "DIA_Babo_Wurst_JA_15_00"); //Okay, hier, nimm noch eine.
	AI_Output (self, other, "DIA_Babo_Wurst_JA_03_01"); //Na gut. Hier ist deine Spruchrolle.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	B_GiveInvItems (self, other, ItSC_Firebolt, 1);
	
	Info_ClearChoices (DIA_Babo_Wurst);
};
FUNC VOID DIA_Babo_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Babo_Wurst_NEIN_15_00"); //Nein, das mache ich nicht.
	AI_Output (self, other, "DIA_Babo_Wurst_NEIN_03_01"); //Mann, du bist auch einer von denen, die es ganz genau nehmen, was?
	Info_ClearChoices (DIA_Babo_Wurst);
};
//***********************************************************************
//	Was ist zwischen dir und Agon passiert? 
//***********************************************************************

INSTANCE DIA_Babo_YouAndAgon   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 3;
	condition   = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent   = FALSE;
	description	= "Was ist zwischen dir und Agon passiert?";
};

FUNC INT DIA_Babo_YouAndAgon_Condition()
{
	if Npc_KnowsInfo (other,DIA_Opolos_Monastery)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Babo_YouAndAgon_Info()
{
	AI_Output (other,self ,"DIA_Babo_YouAndAgon_15_00"); //Was ist zwischen dir und Agon passiert?
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_01"); //Ach, wir hatten einen Streit über die Pflege von Feuernesseln.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_02"); //Die Pflanzen hatten schon fast Wurzelfäule, so sehr hat Agon sie gegossen.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_03"); //Als die Wurzeln dann komplett verfault waren, hat er mir das Ganze in die Schuhe geschoben.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_04"); //Seitdem darf ich den ganzen Tag den Hof fegen.
};
//***********************************************************************
//	Warum hat Agon das getan?
//***********************************************************************
INSTANCE DIA_Babo_WhyDidAgon  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 4;
	condition   = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent   = FALSE;
	description	= "Warum hat Agon das getan?";
};
FUNC INT DIA_Babo_WhyDidAgon_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_WhyDidAgon_Info()
{
	AI_Output (other,self ,"DIA_Babo_WhyDidAgon_15_00"); //Warum hat Agon das getan?
	AI_Output (self ,other,"DIA_Babo_WhyDidAgon_03_01"); //Das musst du schon ihn fragen. Ich glaube, er kann es nicht haben, wenn jemand besser ist als er.
};
//***********************************************************************
//	Du hast wohl Ahnung von Pflanzen?
//***********************************************************************
INSTANCE DIA_Babo_PlantLore  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 5;
	condition   = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent   = FALSE;
	description	= "Du hast wohl Ahnung von Pflanzen?";
};
FUNC INT DIA_Babo_PlantLore_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_PlantLore_Info()
{
	AI_Output (other,self ,"DIA_Babo_PlantLore_15_00"); //Du hast wohl Ahnung von Pflanzen?
	AI_Output (self ,other,"DIA_Babo_PlantLore_03_01"); //Wir hatten einen Kräutergarten, dort habe ich von meinem Opa einige Tricks gelernt.
	AI_Output (self ,other,"DIA_Babo_PlantLore_03_02"); //Ich würde am liebsten wieder im Garten arbeiten.
	
	MIS_HelpBabo = LOG_RUNNING;
	Log_CreateTopic (Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus (Topic_BaboGaertner,LOG_RUNNING);
	B_LogEntry (Topic_BaboGaertner,"Babo würde lieber im Kräutergarten arbeiten, als den Hof zu fegen.");
};
//***********************************************************************
//	Fegen
//***********************************************************************
INSTANCE DIA_Babo_Fegen  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent   = FALSE;
	description	= "Ich soll die Novizenkammern fegen.";
};
FUNC INT DIA_Babo_Fegen_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_Fegen_Info()
{
	AI_Output (other,self ,"DIA_Babo_Fegen_15_00"); //Ich soll die Novizenkammern fegen.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_01"); //Da hast du dir ja viel Arbeit aufgehalst. Weißt du was - ich helfe dir. Alleine schaffst du das nie.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_02"); //Aber ich brauche unbedingt eine 'Windfaust'-Spruchrolle - weißt du, ich hatte das Glück und durfte ein Buch darüber lesen.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_03"); //Und jetzt will ich den Zauber natürlich auch mal anwenden. Also besorge mir die Spruchrolle, dann helfe ich dir.
	
	B_LogEntry 	(Topic_ParlanFegen,"Babo hilft mir, die Novizenkammern zu fegen, wenn ich ihm eine Spruchrolle Windfaust bringe.");
};
//***********************************************************************
//	Windfaust abgeben
//***********************************************************************
INSTANCE DIA_Babo_Windfaust  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 3;
	condition   = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent   = TRUE;
	description	= "Wegen der Spruchrolle...(WINDFAUST geben)";
};
//---------------------------------
var int DIA_Babo_Windfaust_permanent;
//---------------------------------
FUNC INT DIA_Babo_Windfaust_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Babo_Fegen))
	&& (DIA_Babo_Windfaust_permanent == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_Windfaust_Info()
{
	AI_Output (other,self ,"DIA_Babo_Windfaust_15_00"); //Wegen der Spruchrolle...
	AI_Output (self ,other,"DIA_Babo_Windfaust_03_01"); //Hast du einen Windfaust-Zauber für mich?
	
	if B_GiveInvItems (other, self, ItSc_Windfist,1)
	{ 
		AI_Output (other,self ,"DIA_Babo_Windfaust_15_02"); //Hier ist die Spruchrolle, die du wolltest.
		AI_Output (self ,other,"DIA_Babo_Windfaust_03_03"); //Das ist gut. Dann werde ich dir mal helfen, die Kammern zu reinigen.
		
		NOV_Helfer = (NOV_Helfer +1);
		DIA_Babo_Windfaust_permanent = TRUE; 
		B_GivePlayerXP (XP_Feger);
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self,"FEGEN");
		
		B_LogEntry 	(Topic_ParlanFegen,"Babo hilft mir jetzt, die Novizenkammern zu fegen.");
		
	}
	else
	{
		AI_Output (other,self ,"DIA_Babo_Windfaust_15_04"); //Nein, bisher noch nicht.
		AI_Output (self ,other,"DIA_Babo_Windfaust_03_05"); //Ich werde solange warten.
	};
	AI_StopProcessInfos (self);
};


//***********************************************************************
//	 Wie ist das Leben hier im Kloster?
//***********************************************************************
INSTANCE DIA_Babo_Life   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 10;
	condition   = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent   = TRUE;
	description	= "Wie ist das Leben hier im Kloster?";
};
FUNC INT DIA_Babo_Life_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Life_Info()
{
	AI_Output (other,self ,"DIA_Babo_Life_15_00"); //Wie ist das Leben hier im Kloster?
	AI_Output (self ,other,"DIA_Babo_Life_03_01"); //Ich will mich nicht beklagen, aber ich hab nicht gedacht, dass hier alle so streng sind. Wenn du dich nicht an die Regeln hältst, wirst du bestraft.
	AI_Output (self ,other,"DIA_Babo_Life_03_02"); //Viele Novizen wollen natürlich die Lehren Innos' in der Bibliothek studieren, damit sie vorbereitet sind, falls sie erwählt werden.
	AI_Output (self ,other,"DIA_Babo_Life_03_03"); //Aber ich denke, die beste Vorbereitung auf die Prüfung der Magie ist die Erfüllung der eigenen Aufgaben.
	
	if (Npc_KnowsInfo (other,DIA_Igaranz_Choosen) == FALSE)
	{
		AI_Output (other,self ,"DIA_Babo_Life_15_04"); //Was hat es mit den Erwählten und dieser Prüfung auf sich?
		AI_Output (self ,other,"DIA_Babo_Life_03_05"); //Sprich mit Bruder Igaraz. Er kennt sich gut damit aus.
	};
};
//*********************************************************************
//		Sc hat Babo den Gärtnerposten verschafft (Kap. 2)
//*********************************************************************
INSTANCE DIA_Babo_HowIsIt   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 1;
	condition   = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent   = TRUE;
	description	= "Wie geht's?";
};
FUNC INT DIA_Babo_HowIsIt_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Kapitel < 3)
	{
		return TRUE;
	};	
};
//--------------------
var int Babo_XPgiven;
//--------------------
FUNC VOID DIA_Babo_HowIsIt_Info()
{
	AI_Output (other,self ,"DIA_Babo_HowIsIt_15_00"); //Wie geht's?
	
	if (MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_01"); //(demütig) Ich danke den Magiern für meine Aufgabe.
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_02"); //Es macht mir Freude im Garten zu arbeiten und hoffe, dass die Magier zufrieden mit mir sind, Meister.
		
		if (Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP (XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_03"); //(erschrocken) G..g..gut, Meister.
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_04"); //Ich, ich arbeite hart und versuche die Magier nicht zu enttäuschen.
	};
	
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 2
//##
//####################################################

INSTANCE DIA_Babo_Kap2_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap2_EXIT_Condition;
	information = DIA_Babo_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 3
//##
//####################################################

INSTANCE DIA_Babo_Kap3_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap3_EXIT_Condition;
	information = DIA_Babo_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



//******************************
// hallo!
//******************************

INSTANCE DIA_Babo_Kap3_Hello   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent   = FALSE;
	description = "Was machst du hier?";
};
FUNC INT DIA_Babo_Kap3_Hello_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Hello_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Hello_15_00"); //Was machst du hier?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Hello_03_01"); //(schüchtern) Ich versuche, die mir gestellten Aufgaben zur Zufriedenheit des Klosters zu lösen.
	}	
	else
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Hello_03_02"); //Ich darf nicht mir dir reden. Man sieht nicht gern, wenn wir uns mit Fremden unterhalten.
	}; 
};

//*********************************************
//	Kopf hoch!
//*********************************************

INSTANCE DIA_Babo_Kap3_KeepTheFaith   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent   = FALSE;
	description = "Du darfst den Glauben niemals verlieren.";
};
FUNC INT DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_KeepTheFaith_15_00"); //Du darfst den Glauben niemals verlieren.
	AI_Output (self ,other,"DIA_Babo_Kap3_KeepTheFaith_03_01"); //(ertappt) Nein, ... ich meine, das würde ich niemals tun. Ehrlich!
	AI_Output (other,self ,"DIA_Babo_Kap3_KeepTheFaith_15_02"); //Uns allen werden oft schwere Prüfungen auferlegt.
	AI_Output (self ,other,"DIA_Babo_Kap3_KeepTheFaith_03_03"); //Ja, Meister. Ich werde immer daran denken. Danke.
	
	B_GivePlayerXP (XP_Ambient); 
};

//*********************************************
//	Das klingt aber nicht sehr glücklich.
//*********************************************

INSTANCE DIA_Babo_Kap3_Unhappy   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent   = FALSE;
	description = "Das klingt aber nicht sehr glücklich.";
};
FUNC INT DIA_Babo_Kap3_Unhappy_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild != GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_15_00"); //Das klingt aber nicht sehr glücklich.
	AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_03_01"); //(ertappt) Na ja ... ich meine, eigentlich ist ja alles in Ordnung.
	AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_03_02"); //Nur ... Ach, ich will mich nicht beschweren.

	Info_ClearChoices	(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice	(DIA_Babo_Kap3_Unhappy,"Dann hör auf zu jammern.",DIA_Babo_Kap3_Unhappy_Lament); 
	Info_AddChoice	(DIA_Babo_Kap3_Unhappy,"Mir kannst du´s ruhig erzählen.",DIA_Babo_Kap3_Unhappy_TellMe);
};

	FUNC VOID DIA_Babo_Kap3_Unhappy_Lament ()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Lament_15_00"); //Dann hör auf zu jammern.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01"); //(ängstlich) Ich ... Ich ... bitte erzählt den Magiern nichts.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02"); //Ich will nicht schon wieder bestraft werden.
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Lament_15_03"); //Ich denk drüber nach.
		
		Info_ClearChoices	(DIA_Babo_Kap3_Unhappy);
	};
	
	FUNC VOID DIA_Babo_Kap3_Unhappy_TellMe ()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_00"); //Mir kannst du es ruhig erzählen.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01"); //Und du sagst den Magiern wirklich nichts?
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_02"); //Seh ich so aus?
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03"); //Also gut. Ich habe Problem mit einem der Novizen. Er hat mich in der Hand.
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_04"); //Jetzt komm schon raus mit der Sprache.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05"); //Igaraz, das ist der Novize, hat einige von meinen privaten Aufzeichnungen gefunden.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06"); //Er droht mir, dass er sie den Magiern gibt, wenn ich nicht das tue, was er sagt.
		
		MIS_BabosDocs = LOG_RUNNING; 
		
		Log_CreateTopic (Topic_BabosDocs,LOG_MISSION);
		Log_SetTopicStatus (Topic_BabosDocs,LOG_RUNNING);
		B_LogEntry (Topic_BabosDocs,"Der Novize Babo wird von Igaraz aufgrund einiger Dokumente erpresst.");
		
		Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Das ist mir doch ein bisschen zu privat.",DIA_Babo_Kap3_Unhappy_Privat);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Was sollst du für ihn tun?",DIA_Babo_Kap3_Unhappy_ShouldDo);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Was sind das für Dokumente?",DIA_Babo_Kap3_Unhappy_Documents); 
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Vielleicht kann ich dir helfen.",DIA_Babo_Kap3_Unhappy_CanHelpYou);
	};

		FUNC VOID DIA_Babo_Kap3_Unhappy_Privat ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Privat_15_00"); //Das ist mir doch ein bisschen zu privat.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01"); //Ich versteh schon, du willst keinen Ärger. Dann werde ich da wohl alleine mit fertig werden müssen.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Privat_15_02"); //Du schaffst das schon.
		
			Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_ShouldDo ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00"); //Was sollst du für ihn tun?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01"); //Darüber möchte ich nicht reden. Auf jeden Fall ist es nichts Innos-gefälliges.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02"); //Ich mag gar nicht darüber nachdenken, was passiert, wenn das rauskäme.
		
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_Documents ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_00"); //Was sind das für Dokumente?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01"); //(unsicher) Das geht niemanden was an. Das ist ganz und gar meine Sache.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_02"); //Los, sag schon.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03"); //Das sind äh ... Ganz normale Dokument halt. Nichts Besonderes.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_04"); //Ich frag nicht weiter.
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_CanHelpYou ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00"); //Vielleicht kann ich dir helfen?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01"); //Das würdest du tun?
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02"); //Das kommt natürlich ganz drauf an.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03"); //(hastig) Ich würde dich natürlich auch dafür bezahlen.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04"); //Wie viel?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05"); //Ich habe natürlich nicht so viel Geld, aber ich könnte dir eine Spruchrolle geben. Ich habe einen Heilzauber.
			
			Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Da lass ich lieber die Finger von.",DIA_Babo_Kap3_Unhappy_No);
			Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Ich werde mal sehen, was ich tun kann.",DIA_Babo_Kap3_Unhappy_Yes);
		};

			FUNC VOID DIA_Babo_Kap3_Unhappy_No ()
			{
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_No_15_00"); //Davon lass ich lieber die Finger.
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_No_03_01"); //Dann habe ich wohl keine Wahl, dann muss ich das Spiel wohl mitspielen.
			
				Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			};
			
			FUNC VOID DIA_Babo_Kap3_Unhappy_Yes ()
			{
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Yes_15_00"); //Ich werde mal sehen, was ich tun kann.
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01"); //(freudig) Ehrlich, es muss einfach gelingen. Es muss!
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02"); //Also, du musst eigentlich nur rausfinden, wo Igaraz die Sachen aufbewahrt. Dann klaust du sie ihm und alles ist in bester Ordnung.
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Yes_15_03"); //Ganz ruhig. Du machst erstmal weiter, um den Rest kümmere ich mich.
				
				Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			};

//********************************
//Ich hab deine Dokumente
//********************************

INSTANCE DIA_Babo_Kap3_HaveYourDocs   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent   = FALSE;
	description = "Ich hab deine Dokumente.";
};
FUNC INT DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if ((MIS_BabosDocs == LOG_RUNNING				)
	&&   (Npc_HasItems (other,ItWr_BabosDocs_MIS) 	>= 1)
	||  ((Npc_HasItems (other,ItWr_BabosPinUp_MIS) 	>= 1)
	&&   (Npc_HasItems (other,ItWr_BabosLetter_MIS) >= 1)))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_15_00"); //Ich hab deine Dokumente.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_03_01"); //Wirklich? Danke, du hast mich gerettet. Ich weiß gar nicht, wie ich dir danken soll.
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_15_02"); //Ja ja, beruhig dich wieder.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_03_03"); //(aufgeregt) Sind es auch wirklich meine? Bist du dir sicher, zeig her.
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Ich werde sie noch eine Weile behalten.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);
	
	if (BaboSDocsOpen == TRUE)
	{
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Aufgrund der nackten Tatsachen ist der Preis gestiegen.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};
	
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Hier sind sie.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00"); //Ich werde sie noch eine Weile behalten.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01"); //(fassunglos) Was!? Was soll das heißen. Was hast du vor?
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"War nur ein Scherz.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Das ist meine Sache.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
	
	if (Igaraz_IsPartner == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Igaraz und ich sind Partner.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner);
	};
};

	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00"); //War nur ein Scherz.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01"); //(sauer) Haha, ich kann nicht darüber lachen. Also, wo sind sie?
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02"); //Hier.
		
		if (Npc_HasItems (other,ItWr_BabosDocs_MIS) >= 1)
		{
			B_GiveInvItems (other,self,ItWr_BabosDocs_MIS,1);	
		}
		else
		{
			B_GiveInvItems (other,self,ItWr_BabosPinUp_MIS,1);
			B_GiveInvItems (other,self,ItWr_BabosLetter_MIS,1);
		};
		
		B_UseFakeScroll ();
		
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03"); //Ich wollte dich nicht beleidigen, aber ich bin ganz schön nervös wegen der Sache.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04"); //Schon vergessen. Noch viel Spaß mit deinen DOKUMENTEN.
		
		MIS_BabosDocs = LOG_SUCCESS;
		B_GivePlayerXP (XP_BabosDocs);
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00"); //Das ist meine Sache.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01"); //Die Dokumente gehören mir. Du hast kein Recht, sie zu behalten.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02"); //Mach's gut.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00"); //Igaraz und ich sind jetzt Partner.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01"); //(fassungslos) Was? Das könnt ihr nicht machen.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02"); //Anscheinend doch. Ich werde die Papiere behalten und alles bleibt wie gehabt.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03"); //Das Finanzielle werde ich mit Igaraz regeln.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04"); //Also, pass gut auf die Pflanzen auf.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05"); //Du bist ein Schwein. Eine mieses geldgieriges Schwein. Innos wird dich strafen.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,Dialog_Ende,DIA_Babo_Kap3_HaveYourDocs_End);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Halt die Luft an.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Hast du nichts zu tun?",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo);
	};
	
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_End ()
		{
			AI_StopProcessInfos (self);
		};
		
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00"); //Halt die Luft an.
			AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01"); //Mit mir kann man's ja machen.
			
			AI_StopProcessInfos (self); 
		};
						
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00"); //Hast du nichts zu tun?
			AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01"); //Ich hab schon verstanden, aber glaube mir, das wird nicht ohne Konsequenzen bleiben.
			
			AI_StopProcessInfos (self); 
		};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00"); //Aufgrund der nackten Tatsachen ist der Preis gestiegen.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01"); //Du bist auch nicht besser als die Anderen. Was willst du?
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02"); //Was hast du?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03"); //Ich kann dir noch 121 Goldmünzen geben, das ist alles was ich habe.
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Das wird nicht reichen.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Einverstanden.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00"); //Das wird nicht reichen.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01"); //Aber mehr Geld habe ich nicht. Wenn ich das vorher gewusst hätte, wäre ich nie ins Kloster gegangen.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00"); //Einverstanden
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01"); //Hier ist das Geld und die Spruchrolle.
		
		CreateInvItems (self ,ItSc_MediumHeal,1);
		CreateInvItems (self ,ItMi_Gold,121);
		B_GiveInvItems (self,other,ItSc_MediumHeal,1);
		B_GiveInvItems (self ,other,ItMi_Gold,121);
		
		MIS_BabosDocs = LOG_SUCCESS;
		B_GivePlayerXP (XP_BabosDocs); 
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00"); //Hier sind sie.
	
	if (Npc_HasItems (other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems (other,self,ItWr_BabosDocs_MIS,1);	
	}
	else
	{
		B_GiveInvItems (other,self,ItWr_BabosPinUp_MIS,1);
		B_GiveInvItems (other,self,ItWr_BabosLetter_MIS,1);
	};
	
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01"); //Ja, sie sind vollständig.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02"); //Hast du sie angeguckt?
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03"); //Tut das was zur Sache?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04"); //Nein, Hauptsache, ich habe sie wieder.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05"); //Ich hoffe, ich kann jetzt wieder ruhig schlafen.
	
	CreateInvItems (self ,ItSc_MediumHeal,1);
	B_GiveInvItems (self,other,ItSc_MediumHeal,1);
	
	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP (XP_BabosDocs);
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
};

//*********************************************
//	Bist du zufrieden?
//*********************************************

INSTANCE DIA_Babo_Kap3_Perm   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 39;
	condition   = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent   = TRUE;
	description = "Bist du zufrieden mit deiner Aufgabe?";
};
FUNC INT DIA_Babo_Kap3_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Perm_15_00"); //Bist du zufrieden mit deiner Aufgabe?
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_01"); //(wenig überzeugend) Ja, natürlich. Der Glaube an Innos' Weisheit und Stärke gibt mir Kraft.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_02"); //(rauswindend) Ich möchte nicht unverschämt erscheinen, aber ich habe heute noch sehr viel zu tun.
		AI_Output (other,self ,"DIA_Babo_Kap3_Perm_15_03"); //Du darfst weitermachen.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_04"); //(erleichtert) Danke.
	}
	else
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_05"); //Es geht schon, aber ich muss jetzt weitermachen, sonst werde ich heute nicht fertig.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_06"); //Ich will nicht schon wieder bis tief in die Nacht arbeiten, damit ich meinen Soll erfülle und keinen Ärger bekomme.
	};
	
	AI_StopProcessInfos (self); 
};



//####################################################
//##
//##	Kapitel 4
//##
//####################################################

INSTANCE DIA_Babo_Kap4_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap4_EXIT_Condition;
	information = DIA_Babo_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 5
//##
//####################################################

INSTANCE DIA_Babo_Kap5_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap5_EXIT_Condition;
	information = DIA_Babo_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Babo_PICKPOCKET (C_INFO)
{
	npc			= NOV_612_Babo;
	nr			= 900;
	condition	= DIA_Babo_PICKPOCKET_Condition;
	information	= DIA_Babo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Babo_PICKPOCKET_Condition()
{
	C_Beklauen (17, 25);
};
 
FUNC VOID DIA_Babo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Babo_PICKPOCKET);
	Info_AddChoice		(DIA_Babo_PICKPOCKET, DIALOG_BACK 		,DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Babo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Babo_PICKPOCKET);
};
	
func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Babo_PICKPOCKET);
};


