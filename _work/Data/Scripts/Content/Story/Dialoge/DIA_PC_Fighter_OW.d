
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
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Konec s t�m fl�k�n�m - jsi voln�!
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //U� bylo na�ase, aby m� odsud n�kdo dostal.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Rozhodn� jsem ale ne�ekal, �e bys to byl ty. Jsem sakra r�d, �e t� vid�m.
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//(s ��klebkem) Garond ��k�, �e moc j� a �e u� si nem��e dovolit t� vykrmovat.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Kdy� u� o tom mluv�, p�r piv by se docela �iklo. Vypadn�me odsud, ta d�ra m� za��n� nudit.
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Po�kej, m�m tady n�co, co by se ti mohlo hodit.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //Na�el jsem tady v cele tohle brn�n�. Musel ho tu schovat n�jak� v�ze�.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //Na m� je moc mal�, ale tob� by mohlo padnout.
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //D�ky! Uvid�me se u Miltena.
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//Fajn, u Miltena.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Jasn� v�c.
	
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
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//Poslouchej - tady jsem se matlal u� dost dlouho. Je na�ase, abych vid�l tak� n�co jin�ho ne� jen tohle �dol�.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//Jak ses dostal skrz pr�smyk?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//Skrz opu�t�n� d�l vede cesta.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Dobr�. Po�k�m na tu pravou chv�li a pak odsud vypadnu.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//A kam p�jdeme?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//Sly�el jsem, �e Lee je je�t� na�ivu. Cht�l bych se k n�mu znovu p�ipojit.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//V tom p��pad� b� na Onarovu farmu. Lee a jeho chlapci jsou tam. Pot�ebuje dobr� chlapy, jako jsi ty.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//To zn� dob�e. P�jdu se pod�vat, jak se jim vede.
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
	description = "Je�t� se uvid�me.";
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
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//Je�t� se uvid�me.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//S t�m po��tej.
	
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
