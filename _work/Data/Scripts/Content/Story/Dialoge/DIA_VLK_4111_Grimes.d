// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Grimes_EXIT(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 999;
	condition	= DIA_Grimes_EXIT_Condition;
	information	= DIA_Grimes_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};
//--------------------                       
var int Grimes_First;
//--------------------
FUNC INT DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Grimes_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Grimes_Hallo(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 2;
	condition	= DIA_Grimes_Hallo_Condition;
	information	= DIA_Grimes_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Grimes_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_Hallo_Info()
{	
	AI_Output (self,other,"DIA_Grimes_Hallo_05_00");//Ty? Kdo by to byl �ekl, �e se znovu setk�me.
	AI_Output (self,other,"DIA_Grimes_Hallo_05_01");//Tak to vypad�, �e oba v�me, jak z�stat na�ivu. No, jak vid� propadl jsem prospektorstv�.
	
	if (Grimes_First == FALSE)
	{
		Wld_InsertNpc (Snapper,"OW_PATH_148_A");
		Wld_InsertNpc (Snapper,"OW_PATH_146");
		Wld_InsertNpc (Snapper,"OW_PATH_147");
		Wld_InsertNpc (Snapper,"OW_PATH_148");
		Wld_InsertNpc (Snapper,"OW_PATH_264");
		
		Grimes_First = TRUE;
	};
};
// ************************************************************
// 			  	Erz 
// ************************************************************
INSTANCE DIA_Grimes_Erz(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 2;
	condition	= DIA_Grimes_Erz_Condition;
	information	= DIA_Grimes_Erz_Info;
	permanent	= FALSE;
	description	= "Kolik rudy u� jsi vyt�il?";
};                       

FUNC INT DIA_Grimes_Erz_Condition()
{	
	if (Kapitel == 2) 
	&& (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_Erz_Info()
{	
	AI_Output (other,self,"DIA_Grimes_Erz_15_00");//Kolik rudy u� jsi vyt�il?
	AI_Output (self,other,"DIA_Grimes_Erz_05_01");//N�kolik beden. Ale nic z toho tady nez�stalo.
	AI_Output (self,other,"DIA_Grimes_Erz_05_02");//Paladin Marcos se rozhodl vz�t rudu do hradu, proto�e n�s po��d ohro�ovali sk�eti.
};
// ************************************************************
// 			 Weg
// ************************************************************
INSTANCE DIA_Grimes_Weg(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 3;
	condition	= DIA_Grimes_Weg_Condition;
	information	= DIA_Grimes_Weg_Info;
	permanent	= FALSE;
	description = "V�, jakou cestou se vydal Marcos?";
};                       

FUNC INT DIA_Grimes_Weg_Condition()
{	
	if  Npc_KnowsInfo (other, DIA_Grimes_Erz)
	&& (Npc_KnowsInfo (other, DIA_Marcos_Garond) == FALSE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_Weg_Info()
{	
	AI_Output (other,self,"DIA_Grimes_Weg_15_00");//V�, kudy se Marcos vydal?
	AI_Output (self,other,"DIA_Grimes_Weg_05_01");//Ne�el p��mou cestou - m�sto toho cht�l p�ej�t �eku tam, kde byla zamrzl�.
	AI_Output (self,other,"DIA_Grimes_Weg_05_02");//Cht�l si to zkr�tit a dostat se k hradu ze z�padu.
};
// ************************************************************
// 			  Grimes
// ************************************************************
INSTANCE DIA_Grimes_Grimes(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 2;
	condition	= DIA_Grimes_Grimes_Condition;
	information	= DIA_Grimes_Grimes_Info;
	permanent	= FALSE;
	description	= "Nechce� opustit �dol�?";
};                       

FUNC INT DIA_Grimes_Grimes_Condition()
{	
	if (Kapitel == 2) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_Grimes_Info()
{	
	AI_Output (other,self,"DIA_Grimes_Grimes_15_00");//Nechce� opustit �dol�?
	AI_Output (self,other,"DIA_Grimes_Grimes_05_01");//Ne, z�stanu a budu t�it rudu.
	AI_Output (self,other,"DIA_Grimes_Grimes_05_02");//Nenech�m se zastavit n�kolika sk�ety - u� jsem p�e�kal hor�� �asy.
	AI_Output (self,other,"DIA_Grimes_Grimes_05_03");//Pamatuje�, jak jsme t�ili ve star�m dole a najednou se dovnit� provalila voda...
	AI_Output (self,other,"DIA_Grimes_Grimes_05_04");//Ale to jsou star� p��b�hy.
};
// ************************************************************
// 			  Grimes
// ************************************************************
INSTANCE DIA_Grimes_PERM(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 2;
	condition	= DIA_Grimes_PERM_Condition;
	information	= DIA_Grimes_PERM_Info;
	permanent	= TRUE;
	description	= "A co jinak?";
};                       

FUNC INT DIA_Grimes_PERM_Condition()
{	
	if (Kapitel >= 2) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_PERM_Info()
{	
	AI_Output (other,self,"DIA_Grimes_PERM_15_00");//Jak to jinak jde?
	AI_Output (self,other,"DIA_Grimes_PERM_05_01");//Tahle sk�la je zatracen� nepoddajn� - �pln� jako by se sna�ila n�m zabr�nit v z�sk�v�n� rudy.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Grimes_PICKPOCKET (C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 900;
	condition	= DIA_Grimes_PICKPOCKET_Condition;
	information	= DIA_Grimes_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Grimes_PICKPOCKET_Condition()
{
	C_Beklauen (43, 21);
};
 
FUNC VOID DIA_Grimes_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Grimes_PICKPOCKET);
	Info_AddChoice		(DIA_Grimes_PICKPOCKET, DIALOG_BACK 		,DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Grimes_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Grimes_PICKPOCKET);
};
	
func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Grimes_PICKPOCKET);
};




/*
	Keine Ahnung - vielleicht steckt er noch irgendwo da draussen. Ich werde ihn wohl suchen m�ssen.  
	Ich habe ihn gefunden. 
	Er h�lt sich in einem kleinen Tal auf - unweit der Burg. Dort sind die Kisten wenigstens sicher. 
	Innos sei dank...
	
	Nein, bisher nicht. 
	Dann hoffe ich, das er ein Versteck f�r sich und das Erz gefunden hat.
*/

