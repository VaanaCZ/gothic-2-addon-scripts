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
	description	 = 	"Cosa succede?";
};
func int DIA_Mil_309_Stadtwache_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Mil_309_Stadtwache_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Mil_309_Stadtwache_Hallo_15_00"); //Cosa succede?
	if (hero.guild == GIL_MIL)
	|| (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_01"); //È tutto tranquillo. Dobbiamo comunque tenere gli occhi aperti.
	}
	else if (Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	&& (MIl_309_News < 1)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_02"); //Stammi a sentire. Non possiamo farti entrare in città.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_03"); //Ma ti darò un consiglio, e gratis per giunta.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_04"); //Stai alla larga da questa foresta di fronte a noi, è infestata da bestie feroci.
		
		MIl_309_News = 1;
	}
	else if  (Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	&&		 (MIl_309_News == 1)
	{	
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_05"); //Ritornatene da dove sei venuto, miserabile!
	};
	
	if  (Stadtwache_310.aivar[AIV_PASSGATE] == TRUE)
	&&  (MIl_309_News < 2)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_06"); //Ascolta, ora puoi entrare in città, ma non significa che tu possa fare ciò che ti pare qui intorno.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_07"); //Se non rispetterai le regole, perderai tutti i tuoi diritti qui!
		
		MIl_309_News = 2;
	}
	else if (Stadtwache_310.aivar[AIV_PASSGATE] == TRUE)
	&& 		(MIl_309_News == 2)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_08"); //Muoviti, entra!
	};
	
	
	AI_StopProcessInfos (self);
};


