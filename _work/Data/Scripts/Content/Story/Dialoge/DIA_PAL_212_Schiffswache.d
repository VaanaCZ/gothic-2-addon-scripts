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

	description	 = 	"�Qui�n eres t�?";
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
	AI_Output			(other, self, "DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00"); //�Qui�n eres t�?
	AI_Output			(self, other, "DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01"); //Somos emisarios del rey Khobar, los sirvientes de Innos. Com�nmente se nos conoce como paladines.
};


///////////////////////////////////////////////////////////////////////
//	Info WASMACHSTDU2
///////////////////////////////////////////////////////////////////////
instance DIA_Pal_212_Schiffswache_WASMACHSTDU2		(C_INFO)
{
	npc		 	= 	Pal_212_Schiffswache;
	condition	 = 	DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition;
	information	 = 	DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info;

	description	 = 	"�Qu� est�s haciendo aqu�?";
};

func int DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition ()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info ()
{
	AI_Output			(other, self, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00"); //�Qu� hac�is aqu�?

	if (MIS_ShipIsFree == FALSE)
	{
		if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output			(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01"); //No vais a subir a la nave. Eso es todo lo que ten�is que saber.
		}
		else
		{
			AI_Output			(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02"); //Nos han asignado aqu�, como guardias. Nadie puede entrar en la nave. T�, tampoco, lo sentimos.
		};
	}
	else
	{
			AI_Output			(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03"); //Me hac�is perder el tiempo. Preferir�a estar con nuestros hermanos en el Valle de las Minas.
	};
	AI_StopProcessInfos (self);
};

