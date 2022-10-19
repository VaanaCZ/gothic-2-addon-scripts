///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pal_212_Schiffswache_EXIT   (C_INFO)
{
	npc         = Pal_212_Schiffswache;
	nr          = 999;
	condition   = DIA_Pal_212_Schiffswache_EXIT_Condition;
	information = DIA_Pal_212_Schiffswache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pal_212_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pal_212_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info werseidihr
///////////////////////////////////////////////////////////////////////
instance DIA_Pal_212_Schiffswache_WERSEIDIHR		(C_INFO)
{
	npc		 = 	Pal_212_Schiffswache;
	condition	 = 	DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition;
	information	 = 	DIA_Pal_212_Schiffswache_WERSEIDIHR_Info;

	description	 = 	"Kim jesteœ?";
};

func int DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition ()
{
	if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
				return TRUE;
		};
};

func void DIA_Pal_212_Schiffswache_WERSEIDIHR_Info ()
{
	AI_Output			(other, self, "DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00"); //Kim jesteœcie?
	AI_Output			(self, other, "DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01"); //Jesteœmy emisariuszami Króla Rhobara, s³ugami Innosa, ludzie nazywaj¹ nas tak¿e paladynami.
};


///////////////////////////////////////////////////////////////////////
//	Info WASMACHSTDU2
///////////////////////////////////////////////////////////////////////
instance DIA_Pal_212_Schiffswache_WASMACHSTDU2		(C_INFO)
{
	npc		 	= 	Pal_212_Schiffswache;
	condition	 = 	DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition;
	information	 = 	DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info;

	description	 = 	"Co tu porabiasz?";
};

func int DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition ()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info ()
{
	AI_Output			(other, self, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00"); //Co tu robicie?

	if (MIS_ShipIsFree == FALSE)
	{
		if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output			(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01"); //Nie musisz wiedzieæ nic wiêcej poza tym, ¿e nie wejdziesz na statek.
		}
		else
		{
			AI_Output			(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02"); //Zostaliœmy przydzieleni do pracy jako stra¿nicy. Nikt z przechodniów nie mo¿e wejœæ na statek. Ty te¿ nie, przykro mi.
		};
	}
	else
	{
			AI_Output			(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03"); //To wszystko strata czasu. Zdecydowanie bardziej wola³bym wspomagaæ mych braci w Górniczej Dolinie.
	};
	AI_StopProcessInfos (self);
};

