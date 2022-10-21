// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Matt_EXIT(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 999;
	condition	= DIA_Addon_Matt_EXIT_Condition;
	information	= DIA_Addon_Matt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Matt_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Matt_PICKPOCKET (C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 900;
	condition	= DIA_Addon_Matt_PICKPOCKET_Condition;
	information	= DIA_Addon_Matt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Matt_PICKPOCKET_Condition()
{
	C_Beklauen (55, 91);
};
 
FUNC VOID DIA_Addon_Matt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Matt_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Matt_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Matt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Matt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Matt_PICKPOCKET_DoIt);
};

func void DIA_Addon_Matt_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Matt_PICKPOCKET);
};
	
func void DIA_Addon_Matt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Matt_PICKPOCKET);
};
// ************************************************************
// 			  Hello 
// ************************************************************
INSTANCE DIA_Addon_Matt_Hello(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 1;
	condition	= DIA_Addon_Matt_Hello_Condition;
	information	= DIA_Addon_Matt_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Matt_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Matt_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Matt_Hello_10_01"); //Bist neu hier, was? Gut. Wir können jeden Mann gebrauchen!
};

// ************************************************************
// 			 				PERM 
// ************************************************************
INSTANCE DIA_Addon_Matt_PERM (C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 2;
	condition	= DIA_Addon_Matt_PERM_Condition;
	information	= DIA_Addon_Matt_PERM_Info;
	permanent	= TRUE;
	Description  = "Wie sieht's aus?";
};                       
FUNC INT DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Matt_Alright_15_01"); //Wie sieht's aus?
	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_02"); //HEILTRANK! Was ist an Heiltrank nicht zu verstehen?!
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_01"); //Alles im Lot - (zynisch) Käpt'n!
		};
	}
	else if (GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_01"); //Komm mir nicht so! Wir haben kein Schiff mehr.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_02"); //Ich werd mal abwarten, was Greg als nächstes macht.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_03"); //Im Moment ist es ruhig im Lager. Also werde ich mich mal ein bißchen entspannen.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_04"); //Und an deiner Stelle, würde ich dir das gleiche empfehlen.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_05"); //Seit die Banditen da sind, kann sich das schneller ändern, als uns lieb ist.
	};
};

// ************************************************************
// 			 				Banditen
// ************************************************************
INSTANCE DIA_Addon_Matt_Bandits(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 3;
	condition	= DIA_Addon_Matt_Bandits_Condition;
	information	= DIA_Addon_Matt_Bandits_Info;

	description = "Was weißt du über die Banditen?";
};                       
FUNC INT DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_Bandits_Info()
{	
	AI_Output (other, self,"DIA_Addon_Matt_Bandits_15_03"); //Was weißt du über die Banditen?
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_01"); //Du meinst, ausser daß sie mordsgefährlich und uns zahlenmäßig weit überlegen sind?
	AI_Output (other,self ,"DIA_Addon_Matt_Bandits_15_02"); //Ja.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_02"); //Sie haben Gold wie Heu.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_03"); //Nun, zumindest HATTEN sie Gold wie Heu. Ihre letzte Lieferung haben sie nicht bezahlt.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_04"); //Aber ich bezweifele, dass das daran liegt, dass den Mistkerlen das Gold ausgegangen ist.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_05"); //Ich denke eher, sie sind komplett größenwahnsinnig geworden.
};

// ************************************************************
// 			 				Francis 
// ************************************************************
INSTANCE DIA_Addon_Matt_Francis(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 4;
	condition	= DIA_Addon_Matt_Francis_Condition;
	information	= DIA_Addon_Matt_Francis_Info;

	description = "Was weißt du über Francis?";
};                       
FUNC INT DIA_Addon_Matt_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};
func VOID DIA_Addon_Matt_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_00"); //Was weißt du über Francis?
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_01"); //Du meinst, ausser dass er faul und unfähig ist?
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_02"); //Ja.
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_03"); //Lass mich mal überlegen. Hmm... Nein. Mir fällt sonst nichts ein.
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Matt_Anheuern(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 11;
	condition	= DIA_Addon_Matt_Anheuern_Condition;
	information	= DIA_Addon_Matt_Anheuern_Info;
	permanent	= FALSE;
	description = "Komm mit.";
};                       
FUNC INT DIA_Addon_Matt_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Matt_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_00"); //Komm mit.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_01"); //Ich kann nicht weg, ich versuche gerade, mich zu entspannen.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_02"); //Befehl von Greg.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_03"); //(eilig) Ach so. Das ist natürlich was anderes. Ich meine, natürlich komme ich mit.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_04"); //Wo sollst denn hingehen?
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Halt einfach die Klappe und komm mit.",DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Wir sollen den Canyon säubern.",DIA_Addon_Matt_Anheuern_ClearCanyon);
};
func VOID DIA_Addon_Matt_Anheuern_ShutUp()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ShutUp_15_00"); //Halt einfach die Klappe und komm mit.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01"); //(mürrisch) Aye, aye - (sarkastisch) Käpt'n!
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};
func VOID DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00"); //Wir sollen den Canyon säubern.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01"); //Du bist verrückt. Da gibts ein Haufen Viecher. Und Razor, die sind nicht ohne.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02"); //Ich weiß, kommst du jetzt.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03"); //(seufzt) Pack bloss ein paar Heiltränke ein, wir werden sie brauchen!

	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Matt_ComeOn(C_INFO)
{
	npc			= 	PIR_1365_Addon_Matt;
	nr		 	= 	12;
	condition	= 	DIA_Addon_Matt_ComeOn_Condition;
	information	= 	DIA_Addon_Matt_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Komm mit.";
};
func int DIA_Addon_Matt_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Matt_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Matt_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Matt_ComeOn_15_00"); //Komm mit.
	
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_ComeOn_10_01"); //Aye, aye - (zynisch) Käpt'n!
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_GoHome(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 13;
	condition	= DIA_Addon_Matt_GoHome_Condition;
	information	= DIA_Addon_Matt_GoHome_Info;
	permanent	= TRUE;
	description = "Ich brauch dich nicht mehr.";
};                       
FUNC INT DIA_Addon_Matt_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Matt_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_DontNeedYou_15_00"); //Ich brauch dich nicht mehr.
	AI_Output (self, other, "DIA_Addon_Matt_GoHome_10_01"); //(stöht, zu sich) Ich brauch 'n ordentlichen Schluck Grog!
		
	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_TooFar(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 14;
	condition	= DIA_Addon_Matt_TooFar_Condition;
	information	= DIA_Addon_Matt_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Matt_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Matt_TooFar_Info()
{	
	AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_01"); //Ab hier kannst du alleine weitermachen- (zynisch) Käpt'n.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_03"); //Ich und die Jungs gehen zurück zum Lager!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_02"); //Ich geh zurück zum Lager!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 Ich könnte 'nen Heiltrank gebrauchen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_Healing(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 15;
	condition	= DIA_Addon_Matt_Healing_Condition;
	information	= DIA_Addon_Matt_Healing_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Matt_Healing_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Matt_Healing_Info()
{	
	AI_Output (self, other, "DIA_Addon_Matt_Healing_10_01"); //(zynisch) Hallo Käpt'n! Ich könnte 'nen Heiltrank gebrauchen!
};






