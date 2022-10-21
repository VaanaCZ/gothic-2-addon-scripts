// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Doœæ gadania. Oko straci³o sw¹ ochronn¹ moc. Przygotuj siê na œmieræ.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Jeszcze jeden zadufany w sobie karze³, który oœmieli³ siê wspi¹æ na moj¹ ska³ê... Ach, ludzie. Tacy waleczni... i tacy w¹tli.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Ej, ty mówisz!
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Wypatroszê ciê i rzucê twoje wnêtrznoœci œcierwojadom.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Nie tak szybko! Mam tu Oko Innosa. Odpowiesz mi najpierw na moje pytania.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //Aaargh. Pytaj wiêc!

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"Kim jesteœ?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Nazywam siê Pedrakhan. Jak ciê dopadnê, obedrê ¿ywcem ze skóry!

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Który z was, smoków, jest najpotê¿niejszy?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Który z was, smoków, jest najpotê¿niejszy?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //Czerpiemy nasz¹ moc z ¿ywio³ów waszego œwiata. Ich hierarchia jest bardzo prosta.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //Miêkka ziemia obdarza ¿yciem wszystkie istoty pod s³oñcem, ale otworzy siê i poch³onie ciê, jeœli zbli¿ysz siê do niej za bardzo.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //Ska³a, która prêdzej pêknie, ni¿ siê podda, wznosi siê dumnie ku niebu, by pogrzebaæ pod sob¹ nieostro¿nych. A mimo to jest przecie¿ najlepsz¹ ochron¹ przed fal¹ przyp³ywu.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //Iskra ¿ycia p³onie w hucz¹cym ogniu tego œwiata. A przecie¿ ogieñ spala ca³e ¿ycie, pozostawiaj¹c po nim ledwie garstkê popio³u.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //Wszystkie ¿ywio³y maj¹ moc tworzenia i niszczenia. Ale tylko w wodzie, która sta³a siê twarda jak ska³a, wszystko stanie siê s³upem soli, na którym ¿ycie jest niemo¿liwe.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






