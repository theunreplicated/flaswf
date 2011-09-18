/**
 * DATA STRUCTURES FOR GAME PROGRAMMERS
 * Copyright (c) 2007 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package structures.sort 
{
	import structures.DListNode;	
	public function dLinkedInsertionSortCmp(node:DListNode, cmp:Function, descending:Boolean = false):DListNode
	{
		if (!node || cmp == null) return null;
		
		var h:DListNode = node, p:DListNode, n:DListNode, m:DListNode, i:DListNode, val:*;
		
		if (descending)
		{
			n = h.next;
			while (n)
			{
				m = n.next;
				p = n.prev;
				
				if (cmp(p.data, n.data) < 0)
				{
					i = p;
					
					while (i.prev)
					{
						if (cmp(i.prev.data, n.data) < 0)
							i = i.prev;
						else
							break;
					}
					if (m)
					{
						p.next = m;
						m.prev = p;
					}
					else
						p.next = null;
					
					if (i == h)
					{
						n.prev = null;
						n.next = i;
						
						i.prev = n;
						h = n;
					}
					else
					{
						n.prev = i.prev;
						i.prev.next = n;
						
						n.next = i;
						i.prev = n;
					}
				}
				n = m;
			}
		}
		else
		{
			n = h.next;
			while (n)
			{
				m = n.next;
				p = n.prev;
				
				if (cmp(p.data, n.data) > 0)
				{
					i = p;
					
					while (i.prev)
					{
						if (cmp(i.prev.data, n.data) > 0)
							i = i.prev;
						else
							break;
					}
					if (m)
					{
						p.next = m;
						m.prev = p;
					}
					else
						p.next = null;
					
					if (i == h)
					{
						n.prev = null;
						n.next = i;
						
						i.prev = n;
						h = n;
					}
					else
					{
						n.prev = i.prev;
						i.prev.next = n;
						
						n.next = i;
						i.prev = n;
					}
				}
				n = m;
			}
		}
		
		return h;
	}
}
