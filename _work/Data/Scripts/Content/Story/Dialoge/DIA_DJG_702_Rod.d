

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################



///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_RodDJG_EXIT   (C_INFO)
{
	npc         = DJG_702_Rod;
	nr          = 999;
	condition   = DIA_RodDJG_EXIT_Condition;
	information = DIA_RodDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_RodDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RodDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_702_Rod;
	condition	 = 	DIA_RodDJG_HALLO_Condition;
	information	 = 	DIA_RodDJG_HALLO_Info;

	description	 = 	"Wszystko w porz�dku?";
};

func int DIA_RodDJG_HALLO_Condition ()
{
	if (DJG_SwampParty == FALSE)
	{
		return TRUE;
	};
};

func void DIA_RodDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_15_00"); //Wszystko w porz�dku?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_06_01"); //Te buty mnie wyko�cz�! Ca�a zbroja jest naprawd� w porz�dku, ale czy te wi�zania musz� by� tak cholernie ciasne?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_06_02"); //Je�li je troch� poluzuj�, buty pospadaj� mi z n�g.

	if 	(
		((Npc_IsDead(Swampdragon)) == FALSE)
		&& (DJG_SwampParty == FALSE)
		)
			{
			Info_AddChoice	(DIA_RodDJG_HALLO, "Na kogo czekasz?", DIA_RodDJG_HALLO_warten );
			};
	Info_AddChoice	(DIA_RodDJG_HALLO, "Sk�d masz te buty?", DIA_RodDJG_HALLO_Woher );

};
func void DIA_RodDJG_HALLO_Woher ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_Woher_15_00"); //Sk�d masz te buty?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_Woher_06_01"); //Stary wiarus Bennet zrobi� je dla nas, �owc�w smok�w, a my s�ono za ten szmelc zap�acili�my.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_Woher_06_02"); //Je�li kiedy� dorw� tego drania, to ka�� mu ze�re� te buty wraz z podeszwami, a do tego odda� pieni�dze.

};

func void DIA_RodDJG_HALLO_warten ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_15_00"); //Na kogo czekasz?
	
	Info_ClearChoices	(DIA_RodDJG_HALLO);

	if ((Npc_IsDead(DJG_Cipher))== FALSE)
		{
		AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_06_01"); //Czekam, a� Cipher przywlecze tutaj sw�j szanowny ty�ek. Musimy wyrusza�.
		AI_StopProcessInfos (self);
		}
		else
		{
		AI_Output		(self, other, "DIA_RodDJG_HALLO_warten_06_02"); //Pomy�la�em sobie, �e mo�na by zerkn�� nieco dok�adniej na pobliskie bagna.
		AI_Output		(self, other, "DIA_RodDJG_HALLO_warten_06_03"); //Jak my�lisz, powinni�my sprawdzi�, co mo�na na nich znale��?

		Info_AddChoice	(DIA_RodDJG_HALLO, "P�jd� sam.", DIA_RodDJG_HALLO_warten_allein );
		Info_AddChoice	(DIA_RodDJG_HALLO, "Co wiesz o bagnach?", DIA_RodDJG_HALLO_warten_wasweisstdu );
		Info_AddChoice	(DIA_RodDJG_HALLO, "Chod�my tam razem.", DIA_RodDJG_HALLO_warten_zusammen );
		};
};
func void DIA_RodDJG_HALLO_warten_zusammen ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_zusammen_15_00"); //Chod�my tam razem.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_zusammen_06_01"); //W porz�dku. W takim razie, za mn�!

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine	(self,	"SwampWait2");
	
};

func void DIA_RodDJG_HALLO_warten_wasweisstdu ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_wasweisstdu_15_00"); //Co wiesz o bagnach?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_wasweisstdu_06_01"); //Tylko tyle, �e niemi�osiernie cuchn�, i pewnie kryj� w sobie duuu�o z�ota. Czy to nie wystarczy?

};

func void DIA_RodDJG_HALLO_warten_allein ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_allein_15_00"); //P�jd� sam.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_allein_06_01"); //C�, �ycz� powodzenia.

	AI_StopProcessInfos (self);
};



///////////////////////////////////////////////////////////////////////
//	Info WarteMal
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_WARTEMAL		(C_INFO)
{
	npc		 = 	DJG_702_Rod;
	condition	 = 	DIA_RodDJG_WARTEMAL_Condition;
	information	 = 	DIA_RodDJG_WARTEMAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wszystko w porz�dku?";
};

func int DIA_RodDJG_WARTEMAL_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_RodDJG_HALLO))
	|| (DJG_SwampParty == TRUE))
		{
				return TRUE;
		};
};

func void DIA_RodDJG_WARTEMAL_Info ()
{
	AI_Output			(other, self, "DIA_RodDJG_WARTEMAL_15_00"); //Co si� z tob� dzieje?

	if 	(
		((DJG_SwampParty == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02")<1000))
		&& (Npc_IsDead(DJG_Cipher))
		)
		{
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_01"); //S�uchaj cz�owieku! Wszystko wymkn�o si� spod kontroli. Po prostu si� st�d ulotni�.
			DJG_SwampParty = FALSE;
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,	"Start");
		}
	else
		{
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_02"); //Te buty! Te zafajdane buty!
		};

	if 	(Npc_IsDead(SwampDragon))
		{
			AI_Output			(other, self, "DIA_RodDJG_WARTEMAL_15_03"); //I co teraz poczniesz?
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_04"); //Te� pytania zadajesz... Zaczn� od tego, �e kupi� sobie nowe buty!
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,	"Start");
		};
		AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rod_PICKPOCKET (C_INFO)
{
	npc			= DJG_702_Rod;
	nr			= 900;
	condition	= DIA_Rod_PICKPOCKET_Condition;
	information	= DIA_Rod_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rod_PICKPOCKET_Condition()
{
	C_Beklauen (16, 320);
};
 
FUNC VOID DIA_Rod_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rod_PICKPOCKET);
	Info_AddChoice		(DIA_Rod_PICKPOCKET, DIALOG_BACK 		,DIA_Rod_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rod_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rod_PICKPOCKET_DoIt);
};

func void DIA_Rod_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rod_PICKPOCKET);
};
	
func void DIA_Rod_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rod_PICKPOCKET);
};























