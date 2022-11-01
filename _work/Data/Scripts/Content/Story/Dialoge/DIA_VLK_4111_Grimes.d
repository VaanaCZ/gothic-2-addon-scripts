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
	AI_Output (self,other,"DIA_Grimes_Hallo_05_00");//¿Tú? Quién iba a imaginar que volveríamos a vernos.
	AI_Output (self,other,"DIA_Grimes_Hallo_05_01");//Así que parece que ambos sabemos cómo seguir vivos. Y, como puedes ver, sigo con las prospecciones.
	
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
	description	= "¿Cuánto mineral has extraído ya?";
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
	AI_Output (other,self,"DIA_Grimes_Erz_15_00");//¿Cuánto mineral has extraído ya?
	AI_Output (self,other,"DIA_Grimes_Erz_05_01");//Unos cuantos cofres. Pero aquí ya no queda nada.
	AI_Output (self,other,"DIA_Grimes_Erz_05_02");//El paladín Marcos decidió llevar el mineral al castillo, porque los orcos no dejaban de atacarnos.
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
	description = "¿Sabes por dónde se fue Marcos?";
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
	AI_Output (other,self,"DIA_Grimes_Weg_15_00");//¿Sabes por dónde se fue Marcos?
	AI_Output (self,other,"DIA_Grimes_Weg_05_01");//No tomó la ruta directa, ya que quería cruzar el río por donde estaba helado.
	AI_Output (self,other,"DIA_Grimes_Weg_05_02");//Quería atajar y acercarse al castillo desde el oeste.
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
	description	= "¿No quieres irte de este valle?";
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
	AI_Output (other,self,"DIA_Grimes_Grimes_15_00");//¿No quieres irte de este valle?
	AI_Output (self,other,"DIA_Grimes_Grimes_05_01");//No, seguiré extrayendo mineral.
	AI_Output (self,other,"DIA_Grimes_Grimes_05_02");//No voy a dejar que unos cuantos orcos me detengan. He pasado por cosas peores.
	AI_Output (self,other,"DIA_Grimes_Grimes_05_03");//Como cuando estábamos excavando en la vieja mina y, de repente, se inundó...
	AI_Output (self,other,"DIA_Grimes_Grimes_05_04");//Pero eso son viejas historias.
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
	description	= "¿Cómo va tu trabajo?";
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
	AI_Output (other,self,"DIA_Grimes_PERM_15_00");//¿Cómo va tu trabajo?
	AI_Output (self,other,"DIA_Grimes_PERM_05_01");//Esta roca es muy testaruda. Como si intentase evitar que obtuviéramos el mineral.
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

