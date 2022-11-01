///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mil_309_Stadtwache_EXIT   (C_INFO)
{
	npc         = Mil_309_Stadtwache;
	nr          = 999;
	condition   = DIA_Mil_309_Stadtwache_EXIT_Condition;
	information = DIA_Mil_309_Stadtwache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mil_309_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mil_309_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Mil_309_Stadtwache_Hallo		(C_INFO)
{
	npc			 = 	Mil_309_Stadtwache;
	nr 		 	 =  2;
	condition	 = 	DIA_Mil_309_Stadtwache_Hallo_Condition;
	information	 = 	DIA_Mil_309_Stadtwache_Hallo_Info;
	permanent	 =  TRUE;
	description	 = 	"¿Qué pasa?";
};
func int DIA_Mil_309_Stadtwache_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Mil_309_Stadtwache_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Mil_309_Stadtwache_Hallo_15_00"); //¿Qué pasa?
	if (hero.guild == GIL_MIL)
	|| (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_01"); //Todo está tranquilo. Nos andaremos con mucho ojo.
	}
	else if (Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	&& (MIl_309_News < 1)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_02"); //Escucha lo que te digo. No podemos dejarte entrar en la ciudad.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_03"); //Pero voy a darte un consejo, y es completamente gratis.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_04"); //Apártate de este bosque que tenemos delante. Lo frecuentan monstruos feroces.
		
		MIl_309_News = 1;
	}
	else if  (Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	&&		 (MIl_309_News == 1)
	{	
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_05"); //¡Vuelve a meterte debajo de la piedra de la que has salido, canalla!
	};
	
	if  (Stadtwache_310.aivar[AIV_PASSGATE] == TRUE)
	&&  (MIl_309_News < 2)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_06"); //Mira, ya puedes entrar en la ciudad, pero eso no quiere decir que puedas hacer por aquí lo que te dé la gana.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_07"); //¡Si no te ciñes a las normas, perderás todos tus derechos!
		
		MIl_309_News = 2;
	}
	else if (Stadtwache_310.aivar[AIV_PASSGATE] == TRUE)
	&& 		(MIl_309_News == 2)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_08"); //¡Venga, lárgate!
	};
	
	
	AI_StopProcessInfos (self);
};


