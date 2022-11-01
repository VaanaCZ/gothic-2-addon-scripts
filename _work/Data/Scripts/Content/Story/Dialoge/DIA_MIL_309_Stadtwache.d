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
	description	 = 	"Jak to jde?";
};
func int DIA_Mil_309_Stadtwache_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Mil_309_Stadtwache_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Mil_309_Stadtwache_Hallo_15_00"); //Co se stalo?
	if (hero.guild == GIL_MIL)
	|| (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_01"); //Všechno v pohodě. Měli bychom mít oči na stopkách.
	}
	else if (Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	&& (MIl_309_News < 1)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_02"); //Teď poslouchej. Nemůžeme tě pustit do města.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_03"); //Ale dám ti tip, a to naprosto zadarmo.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_04"); //Drž se dál od toho lesa před námi - potulují se po něm líté bestie.
		
		MIl_309_News = 1;
	}
	else if  (Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	&&		 (MIl_309_News == 1)
	{	
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_05"); //Zalez zpátky pod šutrák, červe!
	};
	
	if  (Stadtwache_310.aivar[AIV_PASSGATE] == TRUE)
	&&  (MIl_309_News < 2)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_06"); //Poslouchej - teď máš povolen přístup do města. Ale to neznamená, že by sis tady mohl dělat, co se ti zlíbí.
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_07"); //Když nebudeš dodržovat pravidla, přijdeš o všechna svá práva!
		
		MIl_309_News = 2;
	}
	else if (Stadtwache_310.aivar[AIV_PASSGATE] == TRUE)
	&& 		(MIl_309_News == 2)
	{
		AI_Output (self, other, "DIA_Mil_309_Stadtwache_Hallo_06_08"); //Tak běž - padej!
	};
	
	
	AI_StopProcessInfos (self);
};


