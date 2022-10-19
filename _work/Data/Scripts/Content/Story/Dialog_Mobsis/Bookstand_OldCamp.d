//-------------------------------------------------------------------------------------
//				Milten_03 //oben
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_03_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "������."					);
					Doc_PrintLines	( nDocID,  0, "��������� ���� ������ ����� ������� ������� ������������ ������ �������."	);
					Doc_PrintLines	( nDocID,  0, "����� ����� �� ��������� �����, ������� ���-��� ���������."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "��������");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "�� ������, ��� � ��������� ����� ������� ���� ����� ������. ��, �������, ��� �� ���� ������� ��������. � ����� ��� ������ ����� �� ������������.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "��������");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "����� ����� �� ������ �������� ��� ������, � ��� �������, � ����, ��� �� ���������. �� ������ ������������ ����� ����, ���� ��� �� ������� ������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "��������"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��������, ��� ������� �������� ����������. ���������� ������ � ���, ��� ����������, ���� ����� ..."					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Milten_02 //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "� �������� ���� ���������� ����� ������� ����������. ��� �� ��� ��������, ��� ������� � �������� ������������ ����� � ������?"					);
					Doc_PrintLines	( nDocID,  0, "��, �� ���� �������, ��� � ��� �����������. �� ����� ����, ��� ����� ������� �������� ������."	);
					Doc_PrintLines	( nDocID,  0, "���� ���������� �� ������� ���������� �������."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��������� ���� �����. ��� ����� � ����� ����� - �� ��������, ���� �� ������."					);
					Doc_PrintLines	( nDocID,  1, "�� �����, ��� ��� ���������� ������ ������."					);
					Doc_PrintLines	( nDocID,  1, "��, � � ��������� ��������� ����� ��� ����� ������������ �������� �������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "������"					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Milten_01 //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		//	if (Npc_IsPlayer(self))
		//	{
		//		B_SetPlayerMap(ItWr_Map_OldWorld);
		//	};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_OldWorld.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);

	};
};
//-------------------------------------------------------------------------------------
//				Engor //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Engor_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "������");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "�� ����� ���-��� - ������ ���������. ������ �����������:"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "3 ����� ������"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "8 ������ ������ �������"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "4 ����� � ��������� ���������");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "5 ������ (�������) ���� � ����");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "2 ����� � �������"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "3 ����� � �������������"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "16 ������ � ������� (���� ��� ����� ���)"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "1 ���� � ������� ��������"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "4 ����� � �������� �������"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "56 ����� � �����"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "1 ���� � ���-�� ������ (��� �� ��� �� ����, ��� ������)"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "�����"					);
					Doc_Show		( nDocID );

	};
};

 
