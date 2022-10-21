///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rega_EXIT   (C_INFO)
{
	npc         = BAU_933_Rega;
	nr          = 999;
	condition   = DIA_Rega_EXIT_Condition;
	information = DIA_Rega_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rega_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rega_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_HALLO		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	3;
	condition	 = 	DIA_Rega_HALLO_Condition;
	information	 = 	DIA_Rega_HALLO_Info;

	description	 = 	"Co s�ycha�?";
};

func int DIA_Rega_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rega_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rega_HALLO_15_00"); //Jak idzie praca?
	

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_01"); //Jeste� z miasta, prawda?
		}
	else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_02"); //Nale�ysz do najemnik�w Onara, prawda?
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_03"); //Jeste� magiem, prawda?
		}
	else
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_04"); //Nie jeste� jednym z nas, h�?

		};
		
	AI_Output			(self, other, "DIA_Rega_HALLO_17_05"); //Lepiej zmykaj st�d...
	AI_Output			(other, self, "DIA_Rega_HALLO_15_06"); //Dlaczego?
	AI_Output			(self, other, "DIA_Rega_HALLO_17_07"); //To miejsce nigdy nie by�o rajem, ale przynajmniej mieli�my spok�j, pracuj�c dla Sekoba.
	AI_Output			(self, other, "DIA_Rega_HALLO_17_08"); //Ostatnio sytuacja sta�a si� nie do zniesienia.
	if (Kapitel < 3)
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_09"); //Wsz�dzie grasuj� bandyci, polne bestie niszcz� nasze zbiory, a w�a�ciciel ziemski staje si� coraz bardziej bezwzgl�dny.
		};
};


///////////////////////////////////////////////////////////////////////
//	Info onar
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_ONAR		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	4;
	condition	 = 	DIA_Rega_ONAR_Condition;
	information	 = 	DIA_Rega_ONAR_Info;

	description	 = 	"Czy�by� ba�a si� w�a�ciciela ziemskiego?";
};

func int DIA_Rega_ONAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Rega_ONAR_Info ()
{
	AI_Output			(other, self, "DIA_Rega_ONAR_15_00"); //Czy�by� ba�a si� w�a�ciciela?
	AI_Output			(self, other, "DIA_Rega_ONAR_17_01"); //Jasne, wystarczy, �e nie spodoba mu si� twoja g�ba, a zaraz na�le na ciebie swoich najemnik�w. Tak ko�czy wielu, kt�rzy maj� jakie� ale.
	AI_Output			(self, other, "DIA_Rega_ONAR_17_02"); //Wolimy wi�c trzyma� g�by na k��dk�.

};



///////////////////////////////////////////////////////////////////////
//	Info sld
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_SLD		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	5;
	condition	 = 	DIA_Rega_SLD_Condition;
	information	 = 	DIA_Rega_SLD_Info;

	description	 = 	"Czy najemnicy nie powinni zaj�� si� polnymi bestiami?";
};

func int DIA_Rega_SLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Rega_SLD_Info ()
{
	AI_Output			(other, self, "DIA_Rega_SLD_15_00"); //Czy najemnicy nie powinni zaj�� si� polnymi bestiami?
	AI_Output			(self, other, "DIA_Rega_SLD_17_01"); //Nie wiem, za co im p�ac�, ale na pewno nie za pomaganie nam, prostym ludziom.
	AI_Output			(self, other, "DIA_Rega_SLD_17_02"); //Sprawa polnych bestii to problem ch�op�w wynajmuj�cych ziemi� od Onara.

};


///////////////////////////////////////////////////////////////////////
//	Info banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_BANDITEN		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	6;
	condition	 = 	DIA_Rega_BANDITEN_Condition;
	information	 = 	DIA_Rega_BANDITEN_Info;

	description	 = 	"Jak chronicie si� przed bandytami?";
};

func int DIA_Rega_BANDITEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rega_BANDITEN_Info ()
{
	AI_Output			(other, self, "DIA_Rega_BANDITEN_15_00"); //Jak chronicie si� przed bandytami?
	AI_Output			(self, other, "DIA_Rega_BANDITEN_17_01"); //Nie chronimy si�, uciekamy. C� innego nam pozostaje?

};


///////////////////////////////////////////////////////////////////////
//	Info bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_BRONKO		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	7;
	condition	 = 	DIA_Rega_BRONKO_Condition;
	information	 = 	DIA_Rega_BRONKO_Info;

	description	 = 	"(Zapytaj o Bronka)";
};

func int DIA_Rega_BRONKO_Condition ()
{
	if	( 
		(Npc_KnowsInfo(other, DIA_Bronko_HALLO))
		&& (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
		)
			{
					return TRUE;
			};
};

func void DIA_Rega_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Rega_BRONKO_15_00"); //Kto najbardziej daje si� wam we znaki?
	AI_Output			(self, other, "DIA_Rega_BRONKO_17_01"); //Nie zrozum mnie �le, ale mam do�� k�opot�w. Id� porozmawiaj z kim innym.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	7;
	condition	 = 	DIA_Rega_PERMKAP1_Condition;
	information	 = 	DIA_Rega_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"G�owa do g�ry.";
};

func int DIA_Rega_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rega_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Rega_PERMKAP1_15_00"); //Uszy do g�ry.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_01"); //�atwo powiedzie�. W ko�cu mieszkasz w mie�cie.
		}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_02"); //Gdyby z wami, najemnikami, nie by�o tyle problem�w, reszta sama by si� jako� u�o�y�a.
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_03"); //Z dnia na dzie� widujemy coraz mniej mag�w. Mam nadziej�, �e nie jeste� ostatni. Potrzebujemy was bardziej ni� kiedykolwiek.
		}
		else
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_04"); //To nie�atwe, kiedy pracuje si� dla kogo� tak bezwzgl�dnego jak Sekob, nadzorca niewolnik�w.
		};
	AI_StopProcessInfos (self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rega_PICKPOCKET (C_INFO)
{
	npc			= BAU_933_Rega;
	nr			= 900;
	condition	= DIA_Rega_PICKPOCKET_Condition;
	information	= DIA_Rega_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Rega_PICKPOCKET_Condition()
{
	C_Beklauen (25, 40);
};
 
FUNC VOID DIA_Rega_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rega_PICKPOCKET);
	Info_AddChoice		(DIA_Rega_PICKPOCKET, DIALOG_BACK 		,DIA_Rega_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rega_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rega_PICKPOCKET_DoIt);
};

func void DIA_Rega_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rega_PICKPOCKET);
};
	
func void DIA_Rega_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rega_PICKPOCKET);
};










