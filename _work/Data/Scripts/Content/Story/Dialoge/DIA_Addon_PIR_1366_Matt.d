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
	AI_Output (self ,other,"DIA_Addon_Matt_Hello_10_01"); //Nowy? I dobrze. Przyda nam si� ka�da para r�k!
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
	Description  = "Jak leci?";
};                       
FUNC INT DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Matt_Alright_15_01"); //Jak leci?
	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_02"); //Mikstur� uzdrawiaj�c�!!! Kt�rego z tych dw�ch s��w nie rozumiesz?
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_01"); //Wszystko w porz�dku, 'kapitanie'!
		};
	}
	else if (GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_01"); //Nie dra�nij mnie. Nie mamy ju� naszych statk�w.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_02"); //Zobaczymy, co wymy�li Greg.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_03"); //Na razie w obozie jest cicho. My�l�, �e troch� odpoczn�.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_04"); //Na twoim miejscu zrobi�bym to samo.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_05"); //Od kiedy s� tu bandyci, �atwo o k�opoty.
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

	description = "Co wiesz o bandytach?";
};                       
FUNC INT DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_Bandits_Info()
{	
	AI_Output (other, self,"DIA_Addon_Matt_Bandits_15_03"); //Co wiesz o bandytach?
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_01"); //Poza tym, �e s� niebezpiecznymi mordercami i maj� przewag� liczebn�?
	AI_Output (other,self ,"DIA_Addon_Matt_Bandits_15_02"); //Tak.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_02"); //Maj� du�o z�ota, kt�re wydaj� jak naj�ci.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_03"); //A w�a�ciwie to wydawali du�o z�ota, bo za ostatni� dostaw� nie zap�acili.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_04"); //Nie s�dz�, �eby zabrak�o im z�ota.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_05"); //Pewnie pomy�leli, �e wszystko ujdzie im na sucho.
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

	description = "Co wiesz o Francisie?";
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
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_00"); //Co wiesz o Francisie?
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_01"); //Masz na my�li co� innego, ni� to, �e jest leniwy i niezaradny?
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_02"); //Tak.
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_03"); //Pomy�lmy... Nie, nic innego nie przychodzi mi do g�owy.
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
	description = "Chod� ze mn�.";
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
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_00"); //Chod� ze mn�.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_01"); //Nie widzisz, �e pr�buj� tu odpocz��?
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_02"); //To rozkaz Grega.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_03"); //To czemu nie m�wisz od razu? Ju� id�!
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_04"); //Dok�d idziemy?
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Zamknij si� i id� za mn�.",DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Musimy oczy�ci� kanion.",DIA_Addon_Matt_Anheuern_ClearCanyon);
};
func VOID DIA_Addon_Matt_Anheuern_ShutUp()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ShutUp_15_00"); //Zamknij si� i id� za mn�.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01"); //Tak jest, 'kapitanie'!
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};
func VOID DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00"); //Musimy oczy�ci� kanion.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01"); //Oszala�e�? Tam jest pe�no dzikich bestii! I do tego te brzytwiaki!
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02"); //Wiem o tym. A teraz chod�.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03"); //Lepiej zdob�d� mikstury uzdrawiaj�ce, bo co� mi si� widzi, �e b�dziemy ich potrzebowa�.

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
	description	= 	"Chod�.";
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
	AI_Output (other, self, "DIA_Addon_Matt_ComeOn_15_00"); //Chod�.
	
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_ComeOn_10_01"); //Ta jest, 'kapitanie'!
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
	description = "Nie potrzebuj� ju� twojej pomocy.";
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
	AI_Output (other,self ,"DIA_Addon_Matt_DontNeedYou_15_00"); //Nie potrzebuj� ju� twojej pomocy.
	AI_Output (self, other, "DIA_Addon_Matt_GoHome_10_01"); //Chocia� �yczek grogu!
		
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
	AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_01"); //Mo�esz dalej i�� sam, 'kapitanie'!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_03"); //Wracam z ch�opakami do obozu.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_02"); //Wracam do obozu!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 Ich k�nnte 'nen Heiltrank gebrauchen!
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
	AI_Output (self, other, "DIA_Addon_Matt_Healing_10_01"); //Kapitanie! Przyda�aby mi si� mikstura uzdrawiaj�ca.
};






