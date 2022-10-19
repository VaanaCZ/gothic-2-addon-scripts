// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_DI_EXIT(C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 999;
	condition	= DIA_Lester_DI_EXIT_Condition;
	information	= DIA_Lester_DI_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};   
                    
FUNC INT DIA_Lester_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lester_DI_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_DI_Hello (C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 1;
	condition	= DIA_Lester_DI_Hello_Condition;
	information	= DIA_Lester_DI_Hello_Info;
	permanent	 = 	TRUE;

	description = "Necht�l bys mi n�co ��ct?";
};    
                   
FUNC INT DIA_Lester_DI_Hello_Condition()
{	
	if (Npc_IsDead(UndeadDragon)  == FALSE)
	{
		return TRUE;
	};
};
var int DIA_Lester_DI_SCGotWarning1;
var int DIA_Lester_DI_SCGotWarning2;
FUNC VOID DIA_Lester_DI_Hello_Info()
{	
	AI_Output	(other ,self,"DIA_Lester_DI_Hello_15_00");	//Necht�l bys mi n�co ��ct?

	if (Npc_IsDead(Mario_DI) == FALSE)
	&& (ORkSturmDI  == TRUE)
	&& (DIA_Lester_DI_SCGotWarning1 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_01");	//Kdy� sk�eti za�to�ili, Mario utekl. I kdy� tady na lodi byl zmatek, neztratil jsem ho z o��.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_02");	//Jednodu�e pro�el skrz sk�et� linie - a sk�eti se ho ani nedotkli.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_03");	//Moc se mi ten parchant nel�bil u� od sam�ho za��tku. Je ve spolku s nep��telem.
		B_GivePlayerXP (XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if (Npc_IsDead(Mario_DI) == FALSE)
	&& (DIA_Lester_DI_SCGotWarning2 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_04");	//Ten divn� chlap�k, co si ��k� Mario, se mi nel�b�. M� zlou auru.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_05");	//D�vej si pozor, p��teli.
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_06");	//Te� ne. Mo�n� pozd�ji.
	};
};

// ************************************************************
// 			  				   MarioArsch 
// ************************************************************
INSTANCE DIA_Lester_DI_MarioArsch (C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 2;
	condition	= DIA_Lester_DI_MarioArsch_Condition;
	information	= DIA_Lester_DI_MarioArsch_Info;

	description = "M�l jsi pravdu. Mario n�s zradil.";
};    
                   
FUNC INT DIA_Lester_DI_MarioArsch_Condition()
{	
	if ((DIA_Lester_DI_SCGotWarning2 == TRUE) || (DIA_Lester_DI_SCGotWarning2 == TRUE))
	&& (MIS_Mario_Ambush == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lester_DI_MarioArsch_Info()
{	
	AI_Output	(other ,self,"DIA_Lester_DI_MarioArsch_15_00");	//M�l jsi pravdu. Mario n�s zradil.
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_01");	//Ano. Mo�n� nejsem zrovna nejbyst�ej��, ale tohle mi bylo jasn�.
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_02");	//P��t� bu� p�i vyb�r�n� spole�n�k� opatrn�j��.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 	  	  UndeadDragonDead
// ************************************************************

INSTANCE DIA_PC_Lester_DI_UndeadDragonDead (C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 5;
	condition	= DIA_PC_Lester_DI_UndeadDragonDead_Condition;
	information	= DIA_PC_Lester_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;

	description = "U� se tady moc dlouho nezdr��me.";
};                       
FUNC INT DIA_PC_Lester_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_PC_Lester_DI_UndeadDragonDead_OneTime;
FUNC VOID DIA_PC_Lester_DI_UndeadDragonDead_Info()
{	
	AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_00"); //U� se tady moc dlouho nezdr��me.

	if (DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE )
	{
		if ((Npc_GetDistToWP(self,"DI_DRACONIANAREA_19")<4000) )
			{
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01"); //Zd� se, �e ta bolest hlavy nadobro zmizela.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02"); //Jak jsi to ud�lal?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_03"); //Zni�il jsem nep��tele.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04"); //Muselo to b�t opravdu n�co hodn� mocn�ho. Co to p�esn� bylo?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_05"); //Nemrtv� drak.
			};
	
		if (SC_KnowsMadPsi == TRUE)
			{
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_06"); //Tvoji b�val� p��tel� z t�bora v ba�in�ch mi dali docela zabrat.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07"); //Ano. V�ra hory p�en��. Tak to bylo v�dycky. Bohu�el slou�ili �patn�mu bohu.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08"); //Budu pot�ebovat v�c �asu, ne� se p�es to dok�u �pln� p�en�st.
			};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09"); //Doufejme, �e se u� nikdy nic takov�ho nestane. Na cel�m sv�t� nen� dost tr�vy, kolik bych j� cht�l te� vykou�it.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Za��t");		
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Psionic_DI_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 900;
	condition	= DIA_Psionic_DI_PICKPOCKET_Condition;
	information	= DIA_Psionic_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Psionic_DI_PICKPOCKET_Condition()
{
	C_Beklauen (56, 25);
};
 
FUNC VOID DIA_Psionic_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Psionic_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Psionic_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Psionic_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Psionic_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Psionic_DI_PICKPOCKET_DoIt);
};

func void DIA_Psionic_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Psionic_DI_PICKPOCKET);
};
	
func void DIA_Psionic_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Psionic_DI_PICKPOCKET);
};


