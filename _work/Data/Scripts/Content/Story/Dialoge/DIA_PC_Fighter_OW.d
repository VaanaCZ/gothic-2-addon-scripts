
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornOW_EXIT(C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 999;
	condition	= DIA_GornOW_EXIT_Condition;
	information	= DIA_GornOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_GornOW_Hello (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_Hello_Condition;
	information	= DIA_GornOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_Hello_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_GornOW_Hello_Info()
{	

	VAR C_NPC Milten;
	Milten			= Hlp_GetNpc(PC_Mage_OW);
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Konec s tím flákáním - jsi volný!
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //Už bylo načase, aby mę odsud nękdo dostal.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Rozhodnę jsem ale nečekal, že bys to byl ty. Jsem sakra rád, že tę vidím.
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//(s úšklebkem) Garond âíká, že moc jíš a že už si nemůže dovolit tę vykrmovat.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Když už o tom mluvíš, pár piv by se docela šiklo. Vypadnęme odsud, ta díra mę začíná nudit.
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Počkej, mám tady nęco, co by se ti mohlo hodit.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //Našel jsem tady v cele tohle brnęní. Musel ho tu schovat nęjaký vęzeŕ.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //Na mę je moc malé, ale tobę by mohlo padnout.
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //Díky! Uvidíme se u Miltena.
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//Fajn, u Miltena.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Jasná vęc.
	
	AI_StopProcessInfos (self);
	
	Npc_ExchangeRoutine	(self,"FREE"); 
	B_StartOtherRoutine (Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP (XP_RescueGorn);
};

// ************************************************************
// 			Bei Milten
// ************************************************************
INSTANCE DIA_GornOW_MetMilten (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_MetMilten_Condition;
	information	= DIA_GornOW_MetMilten_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_MetMilten_Condition()
{
	if (Mis_RescueGorn == LOG_SUCCESS)
	&& (Npc_GetDistToWP	(self,"OC_MAGE_LIBRARY_IN") <=	500) 
	&&  Npc_IsInState (self, ZS_Talk)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_GornOW_MetMilten_Info()
{	
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//Poslouchej - tady jsem se matlal už dost dlouho. Je načase, abych vidęl také nęco jiného než jen tohle údolí.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//Jak ses dostal skrz průsmyk?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//Skrz opuštęný důl vede cesta.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Dobrá. Počkám na tu pravou chvíli a pak odsud vypadnu.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//A kam půjdeme?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//Slyšel jsem, že Lee je ještę naživu. Chtęl bych se k nęmu znovu pâipojit.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//V tom pâípadę bęž na Onarovu farmu. Lee a jeho chlapci jsou tam. Potâebuje dobré chlapy, jako jsi ty.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//To zní dobâe. Půjdu se podívat, jak se jim vede.
	};
};	

// ************************************************************
// 	Perm Kap.2
// ************************************************************
INSTANCE DIA_GornOW_SeeYou (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 900;
	condition	= DIA_GornOW_SeeYou_Condition;
	information	= DIA_GornOW_Seeyou_Info;
	permanent	= TRUE;
	description = "Ještę se uvidíme.";
};                       
FUNC INT DIA_GornOW_SeeYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_GornOW_MetMilten)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_GornOW_SeeYou_Info()
{	
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//Ještę se uvidíme.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//S tím počítej.
	
	/*
	if (other.guild == GIL_KDF)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else //SLD
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	};
	*/
	AI_StopProcessInfos (self);
};	
