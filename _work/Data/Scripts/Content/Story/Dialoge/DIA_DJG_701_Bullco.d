
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
INSTANCE DIA_BullcoDJG_EXIT   (C_INFO)
{
	npc         = DJG_701_Bullco;
	nr          = 999;
	condition   = DIA_BullcoDJG_EXIT_Condition;
	information = DIA_BullcoDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_BullcoDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BullcoDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////

instance DIA_BullcoDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		= 5;
	condition	 = 	DIA_BullcoDJG_HALLO_Condition;
	information	 = 	DIA_BullcoDJG_HALLO_Info;

	description	 = 	"O co chodzi?";
};

func int DIA_BullcoDJG_HALLO_Condition ()
{
	if ((Npc_IsDead(DJG_Sylvio))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_BullcoDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_BullcoDJG_HALLO_15_00"); //O co chodzi?
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_01"); //Cholernie zimno! Nie wiem, czemu Sylvio koniecznie chcia� tu przyle��.
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_02"); //W okolicy pe�no jest miejsc, gdzie mo�na co� znale��!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wartemal
///////////////////////////////////////////////////////////////////////
instance DIA_BullcoDJG_WARTEMAL		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		= 6;
	condition	 = 	DIA_BullcoDJG_WARTEMAL_Condition;
	information	 = 	DIA_BullcoDJG_WARTEMAL_Info;

	permanent	 = 	TRUE;

	description	 = 	"Opr�cz tego, wszystko w porz�dku?";
};

func int DIA_BullcoDJG_WARTEMAL_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_BullcoDJG_HALLO))
		|| (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
				return TRUE;
		};
};

func void DIA_BullcoDJG_WARTEMAL_Info ()
{
	AI_Output			(other, self, "DIA_BullcoDJG_WARTEMAL_15_00"); //A poza tym wszystko w porz�dku?

	if (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_01"); //Nie denerwuj mnie.
		}
	else
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_02"); //Nie teraz. Zamarzam! Chc� si� tylko st�d szybko wydosta�.
		};

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info SylvioDead
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_SYLVIODEAD		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		 = 	7;
	condition	 = 	DIA_Bullco_SYLVIODEAD_Condition;
	information	 = 	DIA_Bullco_SYLVIODEAD_Info;
	important	 = 	TRUE;
};

func int DIA_Bullco_SYLVIODEAD_Condition ()
{
	if (Npc_IsDead(DJG_Sylvio))
		{
				return TRUE;
		};
};

func void DIA_Bullco_SYLVIODEAD_Info ()
{
	AI_Output			(self, other, "DIA_Bullco_SYLVIODEAD_06_00"); //Niech to szlag. Sylvio nie �yje.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_WASNUN		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr		 = 	8;
	condition	 = 	DIA_Bullco_WASNUN_Condition;
	information	 = 	DIA_Bullco_WASNUN_Info;

	description	 = 	"Co zamierzasz teraz robi�?";
};

func int DIA_Bullco_WASNUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bullco_SYLVIODEAD))
		&&(Npc_IsDead(DJG_Sylvio))
		{
				return TRUE;
		};
};

func void DIA_Bullco_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_15_00"); //Skoro Sylvio nie �yje, jakie masz teraz plany?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_06_01"); //Nie wiem. P�jd� z innymi �owcami smok�w, je�li jeszcze mnie chc�.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Urw� ci �eb.", DIA_Bullco_WASNUN_kopfab );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Wiesz mo�e, gdzie s� pozostali?", DIA_Bullco_WASNUN_woandere );

};

func void DIA_Bullco_WASNUN_woandere ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_15_00"); //Wiesz, gdzie s� inni?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_06_01"); //Noo... Widzia�em jednego z nich po drugiej stronie rzeki.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Zabierz mnie do tych �owc�w smok�w.", DIA_Bullco_WASNUN_woandere_zuihnen );
};
func void DIA_Bullco_WASNUN_woandere_zuihnen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_15_00"); //Zabierz mnie do tych �owc�w smok�w.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_06_01"); //Hej, nie jestem twoim lokajem.

	Info_ClearChoices	(DIA_Bullco_WASNUN);

	Info_AddChoice	(DIA_Bullco_WASNUN, "Jak sobie chcesz.", DIA_Bullco_WASNUN_woandere_zuihnen_alleine );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Ciesz si�, �e daruj� ci �ycie.", DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Zap�ac� ci za to 50 sztuk z�ota.", DIA_Bullco_WASNUN_woandere_zuihnen_Geld );


};
func void DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00"); //B�dziesz mia� szcz�cie, je�li daruj� ci �ycie.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01"); //Zostaw mnie w spokoju.
	AI_StopProcessInfos (self);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_Geld ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00"); //Zap�ac� ci za to 50 sztuk z�ota.
	
	if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01"); //Niech b�dzie. Dawaj kas�.
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02"); //Chod� za mn�. Poka�� ci, gdzie ostatnio widzia�em jednego z tamtych �owc�w smok�w.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"DJGVorposten");
		}
		else
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03"); //Ty nie masz 50 z�otych monet, a ja nie dam si� nabra�. Spadaj.
			AI_StopProcessInfos (self);
		};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_alleine ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00"); //Jak sobie �yczysz. Na pewno ich znajdziesz.
	AI_Output			(self ,other, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01"); //Tylko si� nie zgub.
	
	AI_StopProcessInfos (self);
};


func void DIA_Bullco_WASNUN_kopfab ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_15_00"); //Urw� ci �eb.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_06_01"); //Zamknij si�!

	Info_AddChoice	(DIA_Bullco_WASNUN, "Wyci�gaj bro�! Sko�czymy to.", DIA_Bullco_WASNUN_kopfab_angriff );


};
func void DIA_Bullco_WASNUN_kopfab_angriff ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_angriff_15_00"); //Wyci�gaj bro�! Sko�czymy to.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_angriff_06_01"); //Niech tak b�dzie!

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bullco_PICKPOCKET (C_INFO)
{
	npc			= DJG_701_Bullco;
	nr			= 900;
	condition	= DIA_Bullco_PICKPOCKET_Condition;
	information	= DIA_Bullco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bullco_PICKPOCKET_Condition()
{
	C_Beklauen (34, 65);
};
 
FUNC VOID DIA_Bullco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bullco_PICKPOCKET);
	Info_AddChoice		(DIA_Bullco_PICKPOCKET, DIALOG_BACK 		,DIA_Bullco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bullco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bullco_PICKPOCKET_DoIt);
};

func void DIA_Bullco_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bullco_PICKPOCKET);
};
	
func void DIA_Bullco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bullco_PICKPOCKET);
};






