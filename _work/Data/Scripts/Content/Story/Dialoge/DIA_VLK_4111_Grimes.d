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
	AI_Output (self,other,"DIA_Grimes_Hallo_05_00");//Tu? Chi avrebbe mai pensato che ci saremmo rivisti.
	AI_Output (self,other,"DIA_Grimes_Hallo_05_01");//Dunque pare che entrambi sappiamo come sopravvivere, e come puoi vedere sono occupato a fare delle ricerche minerarie.
	
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
	description	= "Quanto minerale hai già estratto?";
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
	AI_Output (other,self,"DIA_Grimes_Erz_15_00");//Quanto metallo hai già estratto?
	AI_Output (self,other,"DIA_Grimes_Erz_05_01");//Poche casse. Ma non sono più qui.
	AI_Output (self,other,"DIA_Grimes_Erz_05_02");//Il paladino Marcos ha deciso di portare il metallo al castello, poiché qui siamo sotto costante attacco da parte degli orchi.
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
	description = "Sai in quale direzione è andato Marcos?";
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
	AI_Output (other,self,"DIA_Grimes_Weg_15_00");//Sai in quale direzione è andato Marcos?
	AI_Output (self,other,"DIA_Grimes_Weg_05_01");//Non ha preso la strada diretta - invece ha voluto attraversare il fiume dove si è congelato.
	AI_Output (self,other,"DIA_Grimes_Weg_05_02");//Intendeva fare il giro e avvicinare il castello da ovest.
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
	description	= "Non vuoi lasciare la valle?";
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
	AI_Output (other,self,"DIA_Grimes_Grimes_15_00");//Non vuoi lasciare la valle?
	AI_Output (self,other,"DIA_Grimes_Grimes_05_01");//No, continuerò a estrarre il metallo.
	AI_Output (self,other,"DIA_Grimes_Grimes_05_02");//Non lascerò che qualche orco riesca a fermarmi, ho già affrontato di peggio.
	AI_Output (self,other,"DIA_Grimes_Grimes_05_03");//Quando scavavamo ancora nella vecchia miniera, e l'acqua fece improvvisamente irruzione...
	AI_Output (self,other,"DIA_Grimes_Grimes_05_04");//Ma sono vecchie storie.
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
	description	= "Come va il tuo lavoro?";
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
	AI_Output (other,self,"DIA_Grimes_PERM_15_00");//Come va il tuo lavoro?
	AI_Output (self,other,"DIA_Grimes_PERM_05_01");//Questa roccia è dannatamente dura - quasi stesse cercando di impedirci di prendere il metallo.
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
	Keine Ahnung - vielleicht steckt er noch irgendwo da draussen. Ich werde ihn wohl suchen müssen.  
	Ich habe ihn gefunden. 
	Er hält sich in einem kleinen Tal auf - unweit der Burg. Dort sind die Kisten wenigstens sicher. 
	Innos sei dank...
	
	Nein, bisher nicht. 
	Dann hoffe ich, das er ein Versteck für sich und das Erz gefunden hat.
*/

